require 'rails_helper'

RSpec.describe Administrator, type: :model do
  let(:invalid_administrator) { build(:administrator, email: nil) }

  describe 'Validations' do
    it 'is invalid without email' do
      expect(invalid_administrator).to_not be_valid
    end
  end
end
