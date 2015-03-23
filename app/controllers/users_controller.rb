class UsersController < ApplicationController
  def new
  end

  def show
    @user = User.find_by_id(params[:id])
    stars = Star.where(user_id: current_user.id, plan_id: nil)
    @starred_lessons = []
    stars.each do |s|
      lesson = Lesson.find_by(id: s.lesson_id)
      @starred_lessons << lesson
    end
  end

  def index
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
