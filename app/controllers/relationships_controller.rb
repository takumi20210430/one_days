class RelationshipsController < ApplicationController
  def create
    @follow = current_user.active_relationships.build(follower_id: params[:user_id])
    @follow.save
    @user = User.find(params[:user_id])
    #redirect_back(fallback_location: users_path)　非同期通信
  end

  def destroy
    @follow = current_user.active_relationships.find_by(follower_id: params[:user_id])
    @follow.destroy
    @user = User.find(params[:user_id])
    #redirect_back(fallback_location: users_path)　非同期通信
  end
end
