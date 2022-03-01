require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  describe 'GET /peeps/:id/comments' do
    it 'responds with status 200' do
      user = User.create(email: 'test@example.com', password: 'password123')
      peep = Peep.create(message: 'This is a peep', user_id: user.id)
      comment = Comment.create(body: 'This is a comment', peep_id: peep.id, user_id: user.id)
      session[:user_id] = user.id
      get :index, params: { peep_id: peep.id }
      expect(response).to have_http_status(200)
    end
  end
end