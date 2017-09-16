class RelationshipsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def show
    user = User.find(params[:id])

    followers = user.followers.map do |x|
      {
        user_id: x.id,
        handle: x.handle,
        name: x.name,
        email: x.email
      }
    end

    following = user.following.map do |x|
      {
        user_id: x.id,
        handle: x.handle,
        name: x.name,
        email: x.email
      }
    end

    render json: {
      followers: followers,
      following: following
    }
  end

  def create
    user = User.find(params[:id])
    current_user = User.find(params[:current_user])
    current_user.follow(user)

    render json: {}, status: 200
  end

  def destroy
    user = User.find(params[:id])
    current_user = User.find(params[:current_user])
    current_user.unfollow(user)

    render json: {}, status: 200
  end
end
