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

  describe 'GET /peeps/:id/comments/new' do
    it 'responds with status 200 if logged in' do
      user = User.create(email: 'test@example.com', password: 'password123')
      peep = Peep.create(message: 'This is a peep', user_id: user.id)
      session[:user_id] = user.id
      get :new, params: { peep_id: peep.id }
      expect(response).to have_http_status(200)
    end

    it 'redirects if not logged in' do
      user = User.create(email: 'test@example.com', password: 'password123')
      peep = Peep.create(message: 'This is a peep', user_id: user.id)
      get :new, params: { peep_id: peep.id }
      expect(response).to redirect_to '/log-in'
    end
  end

  describe 'POST /peeps/id/comments' do
    it 'adds a comment to the database and redirects with status 200 if form input is valid' do
      user = User.create(email: 'test@example.com', password: '123456')
      peep = Peep.create(message: 'This is a peep', user_id: user.id)
      post :create, params: { comment: { body: "This is a comment" }, peep_id: peep.id }, session: { user_id: user.id }
      comment = Comment.find_by(body: 'This is a comment')
      expect(comment).to be_a Comment
      expect(comment.body).to eq 'This is a comment'
      expect(response).to redirect_to peep_comments_path
    end

    it 'does not add a comment to the database or redirect to /peeps/:id/comments if form input is not valid' do
      user = User.create(email: 'test@example.com', password: '123456')
      peep = Peep.create(message: 'This is a peep', user_id: user.id)
      post :create, params: { comment: { body: nil }, peep_id: peep.id }, session: { user_id: user.id }
      comment = Comment.find_by(body: 'This is a comment')
      expect(comment).to eq nil
      expect(response).to_not redirect_to peep_comments_path
    end
  end
end
