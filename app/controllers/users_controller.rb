class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def show
    user = User.find(params[:id])
    time = Time.new.strftime('%A')

    headers = ['well check you out, ', "oh snap, it's ", "if i had to pikwon i'd pick you, ",
       'oh hi ', "Q: Who's the best? A: ", '100% pretty cool -> ' , 'Shut up and dance, ',
       "Going up on a #{time}: "]

    render json: {
      user_id: user.id,
      handle: user.handle,
      email: user.email,
      name: user.name,
      greeting: "#{headers.sample}#{user.name}"
    }
  end

# update for api only
  def create
    user = User.create(user_params)
    if user.save
      render json: { user: user.id }, status: 200
    else
      render json: { user: nil }, status: 404
    end
  end

  private

  def user_params
    params.permit(:handle.downcase, :name, :email, :password, :password_confirmation)
  end

end
