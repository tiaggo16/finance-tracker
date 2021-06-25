class FriendshipsController < ApplicationController

  def create
    friend = User.find(params[:friend])
    @friendship = Friendship.create(user: current_user, friend: friend)
    flash[:notice] = "#{friend.full_name} was successfully added to your friends"
    redirect_to my_friends_path
  end

  def destroy
    friend = User.find(params[:id])
    friendship = current_user.friendships.where(friend_id: friend).first
    friendship.destroy
    flash[:notice] = "#{friend.full_name} was successfully removed from my friends"
    redirect_to my_friends_path
  end

  def self.check_db(user, friend)
    where(user: user, friend: friend).first
  end

end