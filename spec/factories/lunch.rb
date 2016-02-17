require 'faker'

FactoryGirl.define do
  factory :lunch do |f|
    f.name {Faker::Name.first_name}
    
  end
end