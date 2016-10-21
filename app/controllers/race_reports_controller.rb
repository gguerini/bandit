class RaceReportsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_race_report, only: [:show, :edit, :update, :destroy]

  def index
    @race_reports = current_user.race_reports.all
  end

  def show
  end

  def new
    @race_report = RaceReport.new
    @race_report.sections.build
  end

  def edit
    @race_report.sections.build unless @race_report.sections.any?
  end

  def create
    @race_report = current_user.race_reports.new(race_report_params)

    respond_to do |format|
      if @race_report.save
        format.html { redirect_to @race_report, notice: 'Race report was successfully created.' }
        format.json { render :show, status: :created, location: @race_report }
      else
        format.html { render :new }
        format.json { render json: @race_report.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @race_report.update(race_report_params)
        format.html { redirect_to @race_report, notice: 'Race report was successfully updated.' }
        format.json { render :show, status: :ok, location: @race_report }
      else
        format.html { render :edit }
        format.json { render json: @race_report.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @race_report.destroy

    respond_to do |format|
      format.html { redirect_to race_reports_url, notice: 'Race report was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_race_report
    @race_report = current_user.race_reports.find(params[:id])
  end

  def race_report_params
    params.require(:race_report).permit(:name, :distance, :location, :race_date, :website, :goal_a, :goal_a_completed, :goal_b, :goal_b_completed, :goal_c, :goal_c_completed,
      sections_attributes: [:id, :title, :description, :order, :_destroy]
    )
  end
end
