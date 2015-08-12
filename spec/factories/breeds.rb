require 'faker'

FactoryGirl.define do
  factory :breed do
    name { Faker::Name.last_name}
    slug { Faker::Internet.slug }
    
  end

end
