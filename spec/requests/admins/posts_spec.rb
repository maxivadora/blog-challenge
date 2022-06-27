require 'rails_helper'

RSpec.describe 'Post Management', type: :request do
  let!(:admin) { create(:administrator) }
  let(:post_params) { attributes_for(:post) }

  describe 'creates a new post' do
    context 'with valid params' do
      it 'creates a new post' do
        get '/admins/posts/new'
        expect(response).to have_http_status(:ok)
        expect(response.body).to include('New Post')

        post '/admins/posts', params: { post: post_params }
        follow_redirect!

        expect(response.body).to include('Post created!')
        expect(response.body).to include(post_params[:title])
      end
    end

    context 'with invalid params' do
      let(:post_params) { attributes_for(:post, :invalid) }

      it 'renders the new page with status 422' do
        post '/admins/posts', params: { post: post_params }

        expect(response.body).to include('New Post')
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'post list' do
    it 'shows a list of posts' do
      get '/admins/posts'
      expect(response).to have_http_status(:ok)

      expect(response.body).to include('Dashboard - Post')
    end
  end

  describe 'edit a post' do
    let(:post) { create(:post) }
    let(:post_params) { { content: 'updated content' } }

    it 'edit a post' do
      get "/admins/posts/#{post.id}/edit"
      expect(response).to have_http_status(:ok)
      expect(response.body).to include('Edit Post')

      put "/admins/posts/#{post.id}", params: { post: post_params }
      follow_redirect!

      expect(response.body).to include('Post updated!')
      expect(response.body).to include('updated content')
    end
  end

  describe 'destroy a post' do
    let(:post) { create(:post, :with_two_comments) }

    it 'destroys a post' do
      delete "/admins/posts/#{post.id}"
      follow_redirect!

      expect(response.body).to include('Post deleted!')
    end
  end
end
