require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:comment) { build(:comment) }

  describe 'Validations' do
    it 'is a valid comment' do
      expect(comment).to be_valid
    end

    it 'is invalid without text' do
      comment.text = nil
      expect(comment).to_not be_valid
    end
  end
end
