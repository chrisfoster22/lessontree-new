class UsersController < ApplicationController
  def new
  end

  def show
    @user = User.all.find_by_id(6)
  end

  def index
  end

  def create
  end

  def update
  end

  def destroy
  end
end
