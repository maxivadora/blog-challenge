require 'rails_helper'

RSpec.describe 'Comment Management', type: :request do
  let(:post1) { create(:post) }
  let(:comment_params) { attributes_for(:comment) }

  describe 'create a comment' do
    context 'with valid params' do
      it 'creates a comment' do
        post "/posts/#{post1.id}/comments", params: { comment: comment_params }
        follow_redirect!

        expect(response.body).to include('Comment created!')
        expect(response.body).to include(comment_params[:text])
        expect(response.body).to include(post1[:title])
      end
    end

    context 'with invalid params' do
      let(:comment_params) { attributes_for(:comment, :invalid) }

      it 'shows error' do
        post "/posts/#{post1.id}/comments", params: { comment: comment_params }

        expect(response.body).to include(post1[:title])
      end
    end
  end
end
