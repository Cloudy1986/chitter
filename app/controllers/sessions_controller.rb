class SessionsController < ApplicationController

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to peeps_url
    else
      render 'new'
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end

end
