class StaticPagesController < ApplicationController
    
    def home
        @next_lunch = Lunches.first
    end 
end 
