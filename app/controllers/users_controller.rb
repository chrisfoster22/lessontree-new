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
  end

  def destroy
  end

  # private def user_params
  #   params.require(:user).permit(:id, :city, :state, :school)
  # end
end
