require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:post) { build(:post) }

  describe 'Validations' do
    it 'is a valid post' do
      expect(post).to be_valid
    end

    it 'is invalid without title' do
      post.title = nil
      expect(post).to_not be_valid
    end
  end
end
