class CommentsController < ApplicationController

  def index
    @peep = Peep.find_by(id: params[:peep_id])
  end

  def new
    require_user
    @peep = Peep.find_by(id: params[:peep_id])
    @comment = Comment.new
  end

  def create
    @peep = Peep.find(params[:peep_id])
    @comment = @peep.comments.create(body: comment_params[:body], user_id: current_user.id)
    redirect_to peep_comments_path
  end

  private
    def comment_params
      params.require(:comment).permit(:body)
    end

end
