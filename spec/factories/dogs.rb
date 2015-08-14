require 'faker'

FactoryGirl.define do
  factory :dog do
    name    { Faker::Name.last_name.gsub(".","") }
    is_female true
    description { Faker::Lorem.sentence }
    age_string { Faker::Lorem.sentence }
    image_url { Faker::Company.logo }
    shelter_url { Faker::Internet.url }
    
    shelter
    breed
  end

end
