class CommentsController < ApplicationController

  def index
    @peep = Peep.find_by(id: params[:peep_id])
  end

end
