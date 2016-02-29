class LunchesController < ApplicationController

  def new
  end
  
  def create
    @lunch = Lunch.new(lunch_params)
    
    if @lunch.save
      redirect_to root_path
    else 
      render 'new'
    end
  end
  
  private 
    def lunch_params 
      params.require(:lunch).permit(:name, :url, :date, :street, :city, :state, :zipcode)
    end
end 
