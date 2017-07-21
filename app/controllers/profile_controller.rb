class ProfileController < ApplicationController
  helper_method :user, :owner?

  def index
    @race_reports = user.race_reports.active
  end

  def show
    @race_report = RaceReport.active.includes(:user, :sections).friendly.find(params[:race_id])
  end

  private

  def user
    @user ||= User.friendly.find(params[:id])
  end

  def owner?
    user_signed_in? && current_user.id == user&.id
  end
end
