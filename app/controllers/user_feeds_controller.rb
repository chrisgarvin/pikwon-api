class UserFeedsController < ApplicationController
  def show
    feed = User.find(params[:id]).feed
    if feed.empty?
      render json: { post: nil }, status: 200
    else
      post = feed.sample
      user = User.find(post.user_id)
      render json: {
        post: {
          user: {
            id: user.id,
            handle: user.handle
          },
          option_1: {
            text: post.options.first.option_text,
            id: post.options.first.id
          },
          option_2: {
            text: post.options.last.option_text,
            id: post.options.last.id
          }
        }
      }
    end
  end
end
