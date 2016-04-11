class Review < ActiveRecord::Base
  belongs_to :lunch
  belongs_to :user
  
  validates_presence_of :lunch_id, :user_id, :body, :title

  delegate :first_name, to: :user, allow_nil: true, prefix: true
  delegate :last_name, to: :user, allow_nil: true, prefix: true
  
  def fullname
    "#{self.user_first_name} #{self.user_last_name}"
  end 
  
end
