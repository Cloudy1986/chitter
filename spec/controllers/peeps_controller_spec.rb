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
  
end
