require 'faker'

FactoryGirl.define do
  factory :breed do
    name      { Faker::Name.last_name.gsub(".","") }
    image_url { Faker::Company.logo   }

    
  end

end
