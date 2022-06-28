require 'rails_helper'

RSpec.describe 'Session Management', type: :request do
  let!(:admin) { create(:administrator) }

  describe 'login' do
    context 'with valid email' do
      it 'login an admin' do
        get '/admins/login'
        expect(response).to have_http_status(:ok)
        expect(response.body).to include('Please sign in')

        post '/admins/login', params: { email: admin.email }
        follow_redirect!

        expect(session[:administrator_id]).to eq(admin.id)
        expect(response.body).to include('Login successfully')
      end
    end

    context 'with invalid email' do
      it 'login an admin' do
        get '/admins/login'
        expect(response).to have_http_status(:ok)
        expect(response.body).to include('Please sign in')

        post '/admins/login', params: { email: 'invalid@email.com' }

        expect(response.body).to include('Invalid email or password. Please try again!.')
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end

  describe 'destroy a post' do
    it 'destroys a post' do
      delete '/admins/logout'
      follow_redirect!

      expect(session[:administrator_id]).to eq(nil)
      expect(response.body).to include('Logged out successfully.')
    end
  end
end
