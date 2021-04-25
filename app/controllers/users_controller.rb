class UsersController < ApplicationController
  # before_action :authenticate_user!

  def index
    @users = User.all
    @user = current_user
    @spa = Spa.new
  end

  def show
    @users = User.all
    @user = User.find(params[:id])
    @spas = @user.spas
    @spa = Spa.new
  end

  def edit
    @user = User.find(params[:id])
    if @user !=current_user
      redirect_to user_path(current_user.id)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have update user successfully"
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  private

  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user.id)
    end
  end

  # def user_params
  #   params.require(:user).permit(:name, )
  # end

end
