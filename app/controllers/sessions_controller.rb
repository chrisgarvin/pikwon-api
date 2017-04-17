class SessionsController < ApplicationController
  def create
    @user = User.find_by_handle(params[:handle].downcase)
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      render json: {}, status: 200
    else
      flash[:danger] = 'Invalid email/password combination'
      redirect_to root_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
