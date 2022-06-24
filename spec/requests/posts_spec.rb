require 'rails_helper'

RSpec.describe 'Post Management', type: :request do
  let(:post) { create(:post) }

  it 'shows a list of posts' do
    get '/posts'
    expect(response).to have_http_status(:ok)
  end

  it 'shows the post detail' do
    get "/posts/#{post.id}"
    expect(response).to have_http_status(:ok)
    expect(response.body).to include(post.title)
  end
end
