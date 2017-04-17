class PostsController < ApplicationController
  def index
    logged_in? && @posts = Post.all
  end
end
