class StaticPagesController < ApplicationController
    
    def home
        @next_lunch = Lunch.last
    end 
end 
