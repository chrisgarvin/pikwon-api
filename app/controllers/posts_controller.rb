class PostsController < ApplicationController
  def index
    logged_in? && @posts = Post.all
  end

  def new
  end

  def get_post
    render json: {
      post: {
        options: ["Do this", "Do that"]
      }
    }
  end

  def new_post
    post = Post.create(user_id: params['user_id'])
    post.options << Option.create(option_text: params['option_1_text'], post_id: post.id)
    post.options << Option.create(option_text: params['option_2_text'], post_id: post.id)

    render json: {}, status: 200
  end
end
