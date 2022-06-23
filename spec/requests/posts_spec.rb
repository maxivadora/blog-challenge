require 'rails_helper'

RSpec.describe 'Post Management', type: :request do
  it 'shows a list of posts' do
    get '/posts'
    expect(response).to have_http_status(:ok)
  end
end
