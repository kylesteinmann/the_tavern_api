class CurrentUserController < ApplicationController
  before_action :authenticate_user!
  def index
    render json: {user: current_user, subscriptions: current_user.subscribers}, status: :ok
  end
end
