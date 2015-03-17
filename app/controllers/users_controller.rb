class UsersController < ApplicationController
  def new
  end

  def show
    @user = User.all.find_by_id(params[:id])
  end

  def index
  end

  def create
  end

  def update
    @user = User.update(user_params)
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :city, :state,
        :school, :avatar)
  end
end
