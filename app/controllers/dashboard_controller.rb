class DashboardController < ApplicationController
  helper_method :user, :owner?

  def index
  end

  private

  def user
    @user ||= User.find_by!(username: params[:username])
  end

  def owner?
    user_signed_in? && current_user.id == user&.id
  end
end
