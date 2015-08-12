require 'faker'

FactoryGirl.define do
  factory :breed do
    name { Faker::Company.name}
    slug { Faker::Internet.slug }
    
  end

end
