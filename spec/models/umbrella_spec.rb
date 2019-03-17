require 'rails_helper'

RSpec.describe Umbrella, type: :model do
  describe 'validations' do
    context 'presence' do
      subject { Umbrella.new }
      it { should validate_presence_of(:message) }
    end
  end
end
