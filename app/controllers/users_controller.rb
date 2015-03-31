class UsersController < ApplicationController
  def new
  end

  def show
    @user = User.find_by_id(params[:id])
    stars = Star.where(user_id: current_user.id)
    @starred_lessons = []
    stars.each do |s|
      lesson = Lesson.find_by(id: s.lesson_id)
      @starred_lessons << lesson
    end
<<<<<<< HEAD

||||||| merged common ancestors
<<<<<<< Temporary merge branch 1
    @starred_lessons
||||||| merged common ancestors
    @starred_lessons = [Lesson.find(104)]
=======
    @starred_lessons = [Lesson.find(params[:id])]
>>>>>>> Temporary merge branch 2
=======
    @starred_lessons
>>>>>>> 0c586bc3f152f2952a252baf5b97ce818e491290
  end

  def index
  end

  def create
  end

  def destroy
  end

  def all_users
    @users = User.all
  end

  private

  def user_params
    params.require(:user).permit(:name, :provider, :uid, :email, :password,
        :password_confirmation, :avatar, :city, :state, :school, :friends, :friendships, :friend_id)
  end
end
