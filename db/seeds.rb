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




  bdh = Shelter.create  name: "Birmingham Dogs Home",
                  description: "Birmingham Dogs Home was founded in 1892 on land made available by the late Sir Alfred Gooch Bart in New Canal Street, Birmingham. Sadly this building, which over a century later still had ‘Birmingham Home for Lost and Starving Dogs' proudly displayed above its doors, was destroyed in a fire during 2014 – but from the foundations established at this humble building, the charity continues to exist and grow.

Almost 100 years after the charities founding - in 1987 - the Duchess of York officially opened the new Bartholomew Street home, which had been purpose-built to provide shelter and protection for over 150 abandoned dogs in comfortable kennel blocks with adjacent facilities, such as its own vets' clinic, puppy unit and isolation block.

The home is a charity which can only survive through the generosity and support of the general public and benefactors from the local community. Without this we would be unable to carry on the vital work of rescuing and rehoming abandoned dogs.

The tremendous help given over the years has allowed us to improve and extend our facilities and, therefore, our ability to care for these unfortunate former pets.

While the Birmingham site houses our head office, our second site - Sunnyside Kennels - in Coven, Wolverhampton, is a showpiece 21st century home built at the cost of £2m and opened in September 2002.

Sunnyside houses 100 strays in state-of-the-art accommodation complete with veterinary consulting room and isolation unit for dogs requiring special, one-to-one care and treatment.",
                  url: "http://www.birminghamdogshome.org.uk",
                  image_url: "http://www.birminghamdogshome.org.uk/img/redesign/BDH_logo.png",
                  contact_details: "http://www.birminghamdogshome.org.uk/contact-us"


  aa = Shelter.create  name: "Animal Allsorts",
                  description: "Animal Allsorts is a small charity in Birmingham, UK that adopts / rehomes unwanted, abandoned or mistreated animals around the West Midlands area. The charity is run entirely by unpaid volunteersusing a network of dedicated foster carers, we do not use kennels",
                  url: "http://www.animalallsorts.org.uk/",
                  image_url: "http://www.animalallsorts.org.uk/images/AnimalAllsortsLogo.jpg",
                  contact_details: "http://www.animalallsorts.org.uk/"

  Shelter.create  name: "Wythall Animal Sanctuary",
                  description: "Wythall Animal Sanctuary was founded by Mr. & Mrs. E. Davies in 1968, whose aim was to save and find homes for as many unwanted pets as possible. Many thousands have been found new homes since then. Many of these animals may otherwise have been destroyed.

                  We have a non-destruction policy and we are the last hope for these animals. As our name signifies we give them true Sanctuary.

                  It costs £6,000 a week to keep the Sanctuary running and we rely entirely on donations, fundraising and Wills to continue our work. Other ways you can help are by becoming a sponsor, joining our 100 Club or by becoming a ‘Friend’ of Wythall Animal Sanctuary.

                  We take in, when possible, animals for rehoming.   Some of these animals will live the rest of their lives with us for one reason or another.  We pick up all the bills, including Veterinary bills, for our residents both long term and animals for re-homing.  We cannot, as we do not have the resources, offer free Veterinary treatment to any animal who is not a resident or up for re-homing.  If you contact us we may be able to advise you on charities which do offer this service.",
                  url: "http://wythallanimalsanctuary.org.uk/",
                  contact_details: "http://wythallanimalsanctuary.org.uk/contact/",
                  image_url: "http://wythallanimalsanctuary.org.uk/wp-content/themes/wythallanimal/images/WAS_logo_dog.jpg"

  
  Shelter.create  name: "Perry Bar Retired Greyhound Trust",
                  description: "Welcome to the website of Perry Barr Retired Greyhound Trust.

On July 1st 2006 Perry Barr RGT moved our retired dogs to Daybreaks Kennels in Solihull.

The kennels are being run by Ruth Boswell who gave up her full time employment as a medical secretary to dedicate all of her time to looking after the retired greyhounds.
Outside Entrance

Our kennels are open daily and you can arrange a viewing time to suit your needs. We have many volunteers who help at 'The Trust' all of whom have been working actively in greyhound rescue and adoption for many years and all have owned their own greyhounds.

The name 'The Retired Greyhound Trust' suggests that the dogs we are trying to home are old, but nothing could be further from the truth, most greyhounds on average retire from racing aged anything between 18 months and 4 years old.

 These wonderful dogs are good with children, are very placid and need only a couple of short walks a day.

If you think you could give a loving home to an ex racer then please give us a call on 0121 782 7702.

If you cannot make up your mind about homing a greyhound, please come along to any of our awareness roadshows and see for yourself what greyhounds are like as pets. Details of these can be found on our events pages.",
                  url: "http://www.rgtperrybarr.co.uk",
                  image_url: "http://www.rgtperrybarr.co.uk/static/sites/perrybarr/im/banner_nodog.gif",
                  contact_details: "http://www.rgtperrybarr.co.uk/contact/"

case Rails.env
when "development"

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


when "production"
  AnimalAllsortsScraper.scrape
  BirminghamDogsHomeScraper.scrape
  PerryBarRetiredGreyhoundTrustScraper.scrape
  WythallAnimalSanctuaryScraper.scrape



end
