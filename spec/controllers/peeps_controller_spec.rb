require 'rails_helper'

RSpec.describe PeepsController, type: :controller do
  describe 'GET /' do
    it 'responds with status 200' do
      get :homepage
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /peeps' do
    it 'responds with status 200' do
      get :index
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /peeps/new' do
    it 'responds with status 200 if logged in' do
      user = User.create(email: 'test@example.com', password: 'password123')
      session[:user_id] = user.id
      get :new
      expect(response).to have_http_status(200)
    end

    it 'redirects if not logged in' do
      get :new
      expect(response).to redirect_to '/log-in'
    end
  end

  describe 'POST /peeps' do
    it 'adds a peep to the database and redirects with status 200 if form input is valid' do
      user = User.create(email: 'test@example.com', password: '123456')
      post :create, params: { peep: { message: "This is a peep" } }, session: { user_id: user.id }
      peep = Peep.find_by(message: 'This is a peep')
      expect(peep).to be_a Peep
      expect(peep.message).to eq 'This is a peep'
      expect(response).to redirect_to '/peeps'
    end

    it 'does not add a peep to the database or redirect to /peeps if form input is not valid' do
      user = User.create(email: 'test@example.com', password: '123456')
      post :create, params: { peep: { message: nil } }, session: { user_id: user.id }
      peeps = Peep.all
      expect(peeps).to be_empty
      expect(response).to_not redirect_to '/peeps'
    end
  end

  describe 'DELETE /peeps/:id' do
    it 'deletes a peep from the database and redirects to /peeps' do
      user = User.create(email: 'test@example.com', password: '123456')
      peep = Peep.create(message: 'This is a peep', user_id: user.id)
      delete :destroy, params: { id: peep.id }
      expect(Peep.all).to be_empty
      expect(response).to redirect_to '/peeps'
    end
  end

end
