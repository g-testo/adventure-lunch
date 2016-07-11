class LunchesController < ApplicationController
  
  def new
    @lunch = Lunch.new
  end
  
  def edit
    @lunch = Lunch.find(params[:id])
  end
  
  def show
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
  
  private
    def lunch_params
      params.require(:lunch).permit(:name, :description, :date, :url)
    end
    
end
