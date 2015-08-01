# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Environment variables (ENV['...']) can be set in the file config/application.yml.
# See http://railsapps.github.io/rails-environment-variables.html

Shelter.all.each(&:destroy)
Dog.all.each(&:destroy)
Breed.all.each(&:destroy)

# Shelters
bdh = Shelter.create  name: "Birmingham Dogs Home",
                      description: "Birmingham Dogs Home was founded in 1892 on land made available by the late Sir Alfred Gooch Bart in New Canal Street, Birmingham. Sadly this building, which over a century later still had ‘Birmingham Home for Lost and Starving Dogs' proudly displayed above its doors, was destroyed in a fire during 2014 – but from the foundations established at this humble building, the charity continues to exist and grow.",
                      url: "http://www.birminghamdogshome.org.uk"

aa = Shelter.create   name: "Animal Allsorts",
                      description: "Animal Allsorts is a small charity in Birmingham, UK that adopts / rehomes unwanted, abandoned or mistreated animals around the West Midlands area. The charity is run entirely by unpaid volunteersusing a network of dedicated foster carers, we do not use kennels",
                      url: "http://www.animalallsorts.org.uk/"



# Breeds
breeds = []
breeds_array = ["German Sheperd", "Staffordshire Bull Terrier", "Border Collie"]

breeds_array.each do |breed|
  breeds.push Breed.create(name: breed)
end

# Dogs
Dog.create({name:  "Max",
            breed: breeds.sample,
            shelter: bdh,
            is_female: false,
            description: "Max is a very friendly dog",
            image_url: "http://placecreature.com/dog/520/355",
            date_of_birth: Date.new(2007, 6, 29)})

Dog.create({name:  "Sadie",
            breed: breeds.sample,
            shelter: bdh,
            is_female: true,
            description: "Sadie is a very friendly dog",
            image_url: "http://placecreature.com/puppy/540/355",
            date_of_birth: Date.new(2003, 8, 9)})

Dog.create({name:  "Lucy",
            breed: breeds.sample,
            shelter: aa,
            is_female: true,
            description: "Lucy is a very friendly dog",
            image_url: "http://placecreature.com/puppy/570/355",
            date_of_birth: Date.new(2012, 2, 7)})

Dog.create({name:  "George",
            breed: breeds.sample,
            shelter: aa,
            is_female: false,
            description: "George is a very friendly dog",
            image_url: "http://placecreature.com/dog/530/355",
            date_of_birth: Date.new(2013, 12, 14)})


            
