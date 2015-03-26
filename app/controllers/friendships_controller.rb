class FriendshipsController < ApplicationController
  before_action :set_friendship, only: [:create, :destroy]

  def create
    @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
    if @friendship.save
      flash[:notice] = "Added follower."
      redirect_to root_url
    else
      flash[:error] = "Unable to add follower."
      redirect_to root_url
    end
  end

  def destroy
    @friendship = current_user.friendships.find(params[:id])
    @friendship.destroy
    flash[:notice] = "Removed friendship."
    redirect_to current_user
  end

  private

  def set_friendship
      @friendship = Friendship.find(params[:id])
    end

  def friendship_params
    params.require(:friendship).permit(:name, :users, :user_id, :provider, :uid, :email, :password,
        :password_confirmation, :avatar, :city, :state, :school)
  end
end
