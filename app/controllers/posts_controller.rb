class PostsController < ApplicationController
  def create
    post = Post.create(user_id: params['user_id'])
    post.options << Option.create(option_text: params['option_1'], post_id: post.id)
    post.options << Option.create(option_text: params['option_2'], post_id: post.id)

    render json: {}, status: 200
  end
end
