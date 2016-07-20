class Lunch < ActiveRecord::Base
    mount_uploader :lunch_image, LunchImageUploader
    # validates_presence_of :name,:url, :date, :street, :city, :state, :zipcode
    # has_many :reviews
    validate :lunch_image_size
    
    private
    
    def lunch_image_size
      if lunch_image.size > 5.megabytes
        errors.add(:lunch_image, "should be less than 5MB")
      end
    end
end 