class LunchesController < ApplicationController
  
  
  before_action :ensure_admin!, except: [:show, :index, ]
  
  def new
  end
  
  def show
    @lunch = Lunch.find(params[:id])
    @reviews = @lunch.reviews
  end 
  
  def create
    @lunch = Lunch.new(lunch_params)
    
    if @lunch.save
      redirect_to root_path
    else 
      render 'new'
    end
  end
  
  def past_lunches
    @past_lunches = Lunch.order(date: :desc).select{|i| i.date < Date.today}.take(8)
  end 
  
  def next_lunch
    @next_lunch = Lunch.order(date: :asc).select do |i| i.date > Date.today end.first 
    if @next_lunch
      redirect_to lunch_path(@next_lunch)
    end 
  end
    
  
  private 
    def lunch_params 
      params.require(:lunch).permit(:name, :url, :date, :street, :city, :state, :zipcode)
    end
    
      
  def ensure_admin!
    unless current_user.try(:admin?)
      redirect_to new_user_session_path
      flash[:alert] = "You are not authorized to do this."
      return false
    end
  end
end 
