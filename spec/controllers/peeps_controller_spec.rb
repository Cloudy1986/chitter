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
    it 'responds with status 200' do
      get :new
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /peeps' do
    it 'adds a peep to the database and redirects with status 200 if form input is valid' do
      post :create, params: { peep: { message: 'This is a peep' } }
      peep = Peep.find_by(message: 'This is a peep')
      expect(peep).to be_a Peep
      expect(peep.message).to eq 'This is a peep'
      expect(response).to redirect_to '/peeps'
    end

    it 'does not add a peep to the database or redirect to /peeps if form input is not valid' do
      post :create, params: { peep: { message: nil } }
      peeps = Peep.all
      expect(peeps).to be_empty
      expect(response).to_not redirect_to '/peeps'
    end
  end

end
