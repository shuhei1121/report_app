class ReportsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_report, only: [:show, :edit, :update, :destroy]
  def index
    @reports = Report.order("created_at DESC")
  end
  
  def new
    @report = Report.new
  end

  def create
    @report = Report.new(report_params)
    if @report.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @report.update(report_params)
      redirect_to report_path(@report.id)
    else
      render :edit
    end
  end

  def destroy
    if @report.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  private
  
  def report_params
    params.require(:report).permit(:title, :headline, :text, :format_id, :category_id, :date, :receiver).merge(user_id: current_user.id)
  end
  
  def set_report
    @report = Report.find(params[:id])
  end

end
