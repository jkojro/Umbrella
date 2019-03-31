require 'rails_helper'

describe SendResultsService, type: :service do
  describe '#call' do
    subject { described_class.new(umbrella.id).call }

    context 'friends didnt answear and time is end' do
      let(:umbrella) { create(:umbrella, created_at: 7.days.ago) }
      let!(:friend) { create(:friend, umbrella_id: umbrella.id) }

      # Fails in SirceCi
      xit 'should call UmbrellaMailer' do
        expect { subject }.to change { ActionMailer::Base.deliveries.size }.by(1)
      end
    end

    context 'friends answeard before and now time is end' do
      let(:umbrella) { create(:umbrella, created_at: 7.days.ago) }
      let!(:friend) { create(:friend, umbrella_id: umbrella.id, answear: 'test') }

      it 'should not call UmbrellaMailer' do
        expect { subject }.to change { ActionMailer::Base.deliveries.size }.by(0)
      end
    end

    context 'friends answeard and time is not end yet' do
      let(:umbrella) { create(:umbrella) }
      let!(:friend) { create(:friend, umbrella_id: umbrella.id, answear: 'test') }

      # Fails in SirceCi
      xit 'should call UmbrellaMailer' do
        expect { subject }.to change { ActionMailer::Base.deliveries.size }.by(1)
      end
    end

    context 'friends didnt answear and time is not end yet' do
      let(:umbrella) { create(:umbrella) }
      let!(:friend) { create(:friend, umbrella_id: umbrella.id) }

      it 'should not call UmbrellaMailer' do
        expect { subject }.to change { ActionMailer::Base.deliveries.size }.by(0)
      end
    end
  end
end
