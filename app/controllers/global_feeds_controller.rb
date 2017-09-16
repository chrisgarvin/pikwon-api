class GlobalFeedsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def show
    current_user = User.find(params[:id])
    post = current_user.global_feed.sample

    if post.nil?
      render json: { post: nil }, status: 200
    else
      user = User.find(post.user_id)
      render json: {
        post: {
          user: {
            id: user.id,
            handle: user.handle
          },
          option_1: {
            text: post.options.first.option_text,
            id: post.options.first.id,
            picks: post.options.first.picks.count
          },
          option_2: {
            text: post.options.last.option_text,
            id: post.options.last.id,
            picks: post.options.last.picks.count
          }
        }
      }
    end
  end
end
