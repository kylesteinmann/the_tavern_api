class CurrentUserController < ApplicationController
  before_action :authenticate_user!
  def index
    render json: {user: current_user}, status: :ok
  end
  def get_subscribers
    render json: {subscriptions: current_user.subscribers}
  end
  def get_subscribees
    render json: {subscriptions: current_user.subscribees}
  end
  def search
    @users = User.where("name LIKE ?", "%#{params[:term]}%")
    render json: @users
  end
end
