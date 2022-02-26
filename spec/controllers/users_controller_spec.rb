require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET /sign-up' do
    it 'responds with status 200' do
      get :new
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /users' do
    it 'adds a user to the database and redirects with status 200 if form input is valid' do
      post :create, params: { user: { email: 'test@example.com', password: '123456'} }
      user = User.find_by(email: 'test@example.com')
      expect(user).to be_a User
      expect(user.email).to eq user.email
      expect(response).to redirect_to '/peeps'
    end

    it 'does not add a user to the database or redirect to /peeps if form input is not valid' do
      post :create, params: { user: { email: nil, password: nil } }
      users = User.all
      expect(users).to be_empty
      expect(response).to_not redirect_to '/peeps'
    end
  end
end
