class LunchesController < ApplicationController
  
  before_action :ensure_admin!, 
    except: [:show, :past_lunches, :next_lunch]
  
  def new
    @lunch = Lunch.new
  end
  
  def show
    @lunch = Lunch.find(params[:id])
    @review = current_user.reviews.build(params[:review]) if user_signed_in?
    @reviews = @lunch.reviews
  end 
  
  def edit
    @lunch = Lunch.find(params[:id])
  end
  
  def index
    @lunches = Lunch.all
  end
  
  def create
    @lunch = Lunch.new(lunch_params)
    if @lunch.save
        redirect_to @lunch, alert: "Lunch created successfully."
    else
        redirect_to new_lunch_path, alert: "Error creating lunch."
    end
  end
  
  def update
    @lunch = Lunch.find(params[:id])
    
    if @lunch.update(lunch_params)
        redirect_to @lunch, alert: "Lunch updated successfully."
    else
        redirect_to edit_lunch_path(@lunch), alert: "Error updating lunch."
    end
  end
  
  def destroy
    @lunch = Lunch.find(params[:id])
    @lunch.destroy
    redirect_to lunches_path
  end
  
  def past_lunches
    @past_lunches = Lunch.order(date: :desc).select{|i| i.date < Date.today}.take(8)
  end 
  
  def next_lunch
    @past_lunches = Lunch.order(date: :desc).select{|i| i.date < Date.today}.take(8)
    @next_lunch = Lunch.order(date: :asc).select do |i| i.date > Date.today end.first 
    if @next_lunch
      redirect_to lunch_path(@next_lunch)
    end 
  end
    
  
  private 
    def lunch_params 
      params.require(:lunch).permit(:name, :url, :date, :street, :city, :state, :zipcode, :description, :lunch_image)
    end
    
      
  def ensure_admin!
    unless current_user.try(:admin?)
      redirect_to new_user_session_path
      flash[:alert] = "You are not authorized to do this."
      return false
    end
  end
end