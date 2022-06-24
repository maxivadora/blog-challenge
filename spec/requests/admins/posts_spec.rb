require 'rails_helper'

RSpec.describe 'Post Management', type: :request do
  let(:post_params) { attributes_for(:post) }

  it 'creates a new post' do
    get '/admins/posts/new'
    expect(response).to have_http_status(:ok)

    post '/admins/posts', params: { post: post_params }
    follow_redirect!

    expect(response.body).to include('Post created!')
    expect(response.body).to include(post_params[:title])
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
