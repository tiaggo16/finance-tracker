class FriendshipsController < ApplicationController

  def create
    @friendship = Friendship.create(user: current_user, friend: friend)
  end

  def destroy
    friend = User.find(params[:id])
    friendship = Friendship.where(user_id: current_user, friend_id: friend.id).first || 
    friendship.destroy
    flash[:notice] = "#{friend.full_name} was successfully removed from my friends"
    redirect_to my_friends_path
  end

end