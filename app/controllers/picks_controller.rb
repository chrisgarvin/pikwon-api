class PicksController < ApplicationController
  skip_before_action :verify_authenticity_token

  def show
    option = Option.find(params[:id])

    render json: {
      picks: option.picks
    }
  end

  def create
    user = User.find(params['user_id'])
    option = Option.find(params['option_id'])

    # check to see if current_user has already voted on particular post, only allow
    # one vote on each post
    if user.picks.where(option_id: option.id).count.zero?
      Pick.create(
        user_id: user.id,
        option_id: option.id,
        post_id: option.post_id,
        skip: params['skip']
      )
    end

    render json: {}, status: 200
  end
end
