class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    @user = User.find_by_handle(params[:handle].downcase)
    if @user && @user.authenticate(params[:password])
      render json: { user: @user.id }, status: 200
    else
      render json: { user: nil }, status: 404
    end
  end
end
