class Lunch < ActiveRecord::Base
    # validates_presence_of :name,:url, :date, :street, :city, :state, :zipcode
    
    has_many :reviews
end 