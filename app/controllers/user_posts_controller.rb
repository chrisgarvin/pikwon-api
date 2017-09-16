class UserPostsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def show
    user = User.find(params[:id])

    posts = user.posts.map do |post|
      {
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
    end

    render json: {
      posts: posts
    }
  end
end
