class StaticPagesController < ApplicationController
    
    def home
        @next_lunch = Lunch.order(date: :asc).select do |i| i.date > Date.today end.first 
        @past_lunches = Lunch.order(date: :desc).select{|i| i.date < Date.today}.take(4)
    end 
    
    def contact
    end 
end 
