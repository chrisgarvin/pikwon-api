class UsersController < ApplicationController
  def get_user
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

  def new
    @user = User.new
  end

# update for api only
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      render json: {}, status: 200
    else
    end
  end

  private

  def user_params
    params.require(:user).permit(:handle.downcase, :name, :email, :password, :password_confirmation)
  end

end
