class StaticPagesController < ApplicationController
    
    def home
        @next_lunch = Lunch.first
    end 
end 
