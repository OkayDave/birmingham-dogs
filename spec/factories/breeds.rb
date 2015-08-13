require 'faker'

FactoryGirl.define do
  factory :breed do
    name      { Faker::Name.last_name }
    slug      { Faker::Internet.slug  }
    image_url { Faker::Internet.url   }

    
  end

end
