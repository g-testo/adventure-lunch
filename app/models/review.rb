class Review < ActiveRecord::Base
  belongs_to :lunch
  belongs_to :user
  
  validates_presence_of :user_id, :body, :title, :lunch_id, :swords 

  delegate :first_name, to: :user, allow_nil: true, prefix: true
  delegate :last_name, to: :user, allow_nil: true, prefix: true
  
  def fullname
    "#{self.user_first_name} #{self.user_last_name}"
  end 
  
end
