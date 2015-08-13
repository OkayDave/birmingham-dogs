require 'faker'

FactoryGirl.define do
  factory :shelter do
    name            { Faker::Name.last_name  }
    description     { Faker::Lorem.sentence }
    url             { Faker::Internet.url }
    image_url       { Faker::Internet.url }
    contact_details { Faker::Internet.url}
  end

end
