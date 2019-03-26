require 'rails_helper'

describe UmbrellasController, type: :controller do
  include Devise::TestHelpers
  include ActiveJob::TestHelper

  let(:user) { create(:user) }
  before { sign_in user }

  describe 'GET #new' do
    let(:action) { get :new }
    context 'user has no umbrella created yet' do
      it 'renders the :new view' do
        action
        expect(response.status).to eq(200)

        expect(response).to render_template :new
      end
    end

    context 'user has already umbrella created' do
      let(:umbrella) { build(:umbrella) }
      before { user.umbrellas << umbrella }
      it 'redirect to :show view' do
        action
        expect(response.status).to eq(302)
        expect(subject).to redirect_to action: :show, id: umbrella.id
      end
    end
  end

  describe 'POST #create' do
    let(:umbrella) { build(:umbrella) }
    before { enqueued_jobs.clear }

    context 'with nested friends' do
      let(:action) { post :create, params: { umbrella: attributes_for(:umbrella).merge(friends_attributes: [ attributes_for(:friend), attributes_for(:friend)]) }}

      it 'response with status 200' do
        expect(response.status).to eq(200)
      end

      it 'creates umbrella with valid attributes' do
        expect { action }.to change { Umbrella.count }.by(1)
        .and change { Friend.count }.by(2)
      end

      it 'enqueues UmbrellaMailToFriendSenderJob for each friend' do
        expect { action }.to have_enqueued_job(UmbrellaMailToFriendSenderJob).twice
      end

      it 'enqueues UmbrellaResultMailSenderJob' do
        expect { action }.to have_enqueued_job(UmbrellaResultMailSenderJob).once
      end
    end

    context 'without nested friends' do
      let(:action) { post :create, params: { umbrella: attributes_for(:umbrella) }}

      it 'response with status 200' do
        expect(response.status).to eq(200)
      end

      it 'creates umbrella with valid attributes' do
        expect { action }.to change { Umbrella.count }.by(1)
      end

      it 'do not enqueues UmbrellaMailToFriendSenderJob' do
        expect { action }.not_to have_enqueued_job(UmbrellaMailToFriendSenderJob)
      end

      it 'enqueues UmbrellaResultMailSenderJobb' do
        expect { action }.to have_enqueued_job(UmbrellaResultMailSenderJob).once
      end
    end
  end

  describe 'GET #show' do
    let(:umbrella) { create(:umbrella) }
    let(:action) { get :show, params: { id: umbrella.id }}

    it 'renders the :show view' do
      action
      expect(response.status).to eq(200)
      expect(response).to render_template :show
    end
  end
end
