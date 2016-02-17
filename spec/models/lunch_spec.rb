require 'rails_helper'

describe Lunch do 
  it "has a valid factory" do
    FactoryGirl.create(:lunch).should be_valid
  end

  it "should be invalid without a name" do 
    FactoryGirl.build(:lunch, name: nil).should_not be_valid
  end 

end 