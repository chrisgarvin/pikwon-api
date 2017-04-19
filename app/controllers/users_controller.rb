class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]

  def index
    @users = User.paginate(page: params[:page])
    if params[:search]
      @users = User.search(params[:search]).order("created_at DESC")
      @posts = Post.search(params[:search]).order("created_at DESC")
    else
      @users = User.all.order('created_at DESC')
    end
  end

  def show
    @user = User.where(id: params[:id]).first
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      render json: {}, status: 200
    else
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id]).destroy
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:handle.downcase, :name, :email, :password, :password_confirmation)
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless @user == current_user
  end

end
