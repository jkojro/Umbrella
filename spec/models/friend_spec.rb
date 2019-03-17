require 'rails_helper'

RSpec.describe Friend, type: :model do
  describe 'validations' do
    context 'presence' do
      subject { FactoryBot.build(:friend) }
      it { should validate_presence_of(:email) }
      it { should validate_presence_of(:answear) }
    end
  end
end
