require 'rails_helper'

RSpec.describe Friend, type: :model do
  describe 'validations' do
    context 'presence' do
      subject { FactoryBot.build(:friend) }
      it { should validate_presence_of(:email) }
    end

    context "email format" do
      it { should allow_value("email@addresse.foo").for(:email) }
      it { should_not allow_value("foo").for(:email) }
    end
  end

  describe 'associations' do
    it { should belong_to(:umbrella) }
  end
end
