require 'rails_helper'

RSpec.describe Admin, type: :model do
  let(:invalid_admin) { build(:admin, email: nil) }

  describe 'Validations' do
    it 'is invalid without email' do
      expect(invalid_admin).to_not be_valid
    end
  end
end
