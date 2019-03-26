require 'rails_helper'

describe FriendsController, type: :controller do

  describe 'PUT #update' do
    context 'updates answear attribute' do
      let!(:friend) { create(:friend) }
      let(:params) { { answear: 'sample friend updated answear' } }
      let(:action) { put :update, params: { umbrella_id: friend.umbrella_id, id: friend.id, friend: params } }

      it 'saves the new friend answear' do
        action
        expect(friend.reload.answear).to eq params[:answear]
      end
    end
  end
end
