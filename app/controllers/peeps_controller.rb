class PeepsController < ApplicationController
  def index
    @peeps = Peep.all.sort_by(&:created_at).reverse
  end

  def new
    require_user
    @peep = Peep.new
  end

  def create
    @peep = Peep.new(message: peep_params[:message], user_id: session[:user_id])
    if @peep.save
      redirect_to peeps_url
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
    def peep_params
      params.require(:peep).permit(:message)
    end
end
