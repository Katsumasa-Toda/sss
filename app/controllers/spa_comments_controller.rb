class SpaCommentsController < ApplicationController

  def create
    @spa = Spa.find(params[:spa_id])
    comment = @spa.spa_comment.new(spa_comment_params)
    comment.user_id = current_user.id
    comment.save
    render :index
  end

  def destroy
    SpaComment.find_by(id: params[:id], spa_id: params[:book_id]).destroy
    @spa = Spa.find(params[:spa_id])
    render :index
  end

  private

  def spa_comment_params
    params.require(:spa_comment).permit(:comment, :spa_id, :user_id)
  end
end
