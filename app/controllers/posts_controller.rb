class PostsController < ApplicationController

  def get_post
    render json: {
      post: {
        options: ["Do this", "Do that"]
      }
    }
  end

# update for api only
  def new_post
    post = Post.create(user_id: params['user_id'])
    post.options << Option.create(option_text: params['option_1_text'], post_id: post.id)
    post.options << Option.create(option_text: params['option_2_text'], post_id: post.id)

    render json: {}, status: 200
  end
end
