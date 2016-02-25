class StaticPagesController < ApplicationController
    
    def home
        @next_lunch = Lunch.order(date: :asc).select do |i| i.date > Date.today end.first 
    end 
end 
