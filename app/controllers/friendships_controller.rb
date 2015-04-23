class FriendshipsController < ApplicationController
  def create
    @friendship = current_user.friendships.build(friend_id: params[:friend_id])
    if @friendship.save
      flash[:notice] = 'You are now following this user.'
      redirect_to current_user
    else
      flash[:error] = 'Unable to follow this user.'
      redirect_to current_user
    end
  end

  def destroy
    @friendship = current_user.friendships.find_by(friend_id: params[:id])
    @friendship.destroy
    flash[:notice] = 'You stopped following this user.'
    redirect_to current_user
  end

  private

  def friendship_params
    params.require(:friendship).permit(:user_id, :friend_id)
  end
end
