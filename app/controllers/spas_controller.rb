class SpasController < ApplicationController

  def new
    @spa = Spa.new
  end

  def create
    @spa = Spa.new(spa_params)
    @spa.user_id = current_user.id
    if @spa.save
      redirect_to spas_path(@spa)
    else
      @spas = Spa.all
      @user = current_user
      render :index
    end
  end

  def index
    @spas = Spa.includes(:favorited_users).sort {|a,b| b.favorited_users.size <=> a.favorited_users.size}
    @spa = Spa.new
    @user = current_user
  end

  def show
    @spa = Spa.find(params[:id])
    @spa_new = Spa.new
    @user = @spa.user
    @spa_comment = SpaComment.new
    @spa_comments = @spa.spa_comments
  end

  def edit
    @spa = Spa.find(params[:id])
  end

  def update
    @spa = Spa.find(params[:id])
    @spa.user_id = current_user.id
    if @spa.update(spa_params)
      flash[:notice] = "You have updated spa successfully"
      redirect_to spa_path(@spa)
    else
      render :edit
    end
  end

  def destroy
    @spa = Spa.find(params[:id])
    @spa.destroy
    redirect_to spa_path
  end

  private

  def spa_params
    params.require(:spa).permit(:name, :address, :introduction, :bath, :parking, :opening)
  end

  # def ensure_correct_user
  #   @spa = Spa.find(params[:id])
  #   unless @spa.user == current_user
  #     redirect_to spas_path
  #   end
  # end
end
