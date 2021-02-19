class ReportsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :search]
  before_action :set_report, only: [:show, :edit, :update, :destroy, :access_limit]
  before_action :access_limit, only: [:edit, :destroy]

  def index
    @reports = Report.order("created_at DESC").all.page(params[:page]).per(10)
    if user_signed_in?
      @reports = Report.order("created_at DESC").all.page(params[:page]).per(10)
      @to_reports = Report.where(receiver: current_user.name).order("created_at DESC").all.page(params[:page]).per(5)
    end

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

  def search
    @keyword = params[:keyword]
    @reports = Report.search(@keyword).order("created_at DESC").all.page(params[:page]).per(10)
    @to_reports = Report.search(@keyword).where(receiver: current_user.name).order("created_at DESC").all.page(params[:page]).per(5)
  end

  private
  
  def report_params
    params.require(:report).permit(:title, :headline, :text, :format_id, :category_id, :date, :receiver).merge(user_id: current_user.id)
  end
  
  def set_report
    @report = Report.find(params[:id])
  end

  def access_limit
    if current_user.id != @report.user_id
      redirect_to root_path
    end
  end

end
