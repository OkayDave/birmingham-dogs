require 'faker'

FactoryGirl.define do
  factory :dog do
    name    { Faker::Name.last_name }
    is_female true
    description { Faker::Lorem.sentence }
    age_string { Faker::Lorem.sentence }
    image_url { Faker::Internet.url }
    shelter_url { Faker::Internet.url }
    slug { Faker::Internet.slug }
    
    shelter
    breed
  end

end
