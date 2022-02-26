require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe 'GET /log-in' do
    it 'responds with status 200' do
      get :new
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /log-in' do
    it 'checks email and password and redirects to /peeps if correct' do
      test_user = User.create(email: 'test@example.com', password: 'password123')
      post :create, params: { session: { email: 'test@example.com', password: 'password123'} }
      expect(session[:user_id]).to eq test_user.id
      expect(response).to redirect_to '/peeps'
    end

    it 'does not redirect to /peeps if incorrect password submitted' do
      test_user = User.create(email: 'test@example.com', password: 'password123')
      post :create, params: { session: { email: 'test@example.com', password: 'incorrectpassword'} }
      expect(response).to_not redirect_to '/peeps'
    end
  end
end