class UsersController < ApplicationController
  def new
  end

  def show
    @user = User.find_by_id(params[:id])
  end

  def index
    redirect_to root_path
  end

  def create
  end

  # def update
  #   @user = User.update(user_params)
  # end

  def destroy
  end

  # private
  #
  def user_params
    params.require(:user).permit(:name, :email, :password,
        :password_confirmation, :avatar, :city, :state, :school)
  end
end
