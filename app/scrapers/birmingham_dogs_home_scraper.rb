
# {"id"=>"438", "reference"=>"38250", "breed"=>"Staffordshire Bull Terrier", "size"=>"Medium", "gender"=>"Female", "centre"=>"Birmingham", "dog_name"=>"Lucky", "age"=>"3-4yrs", "home_tested"=>"", "child_suitability"=>"8 Years +", "live_with_dogs"=>"Possibly", "live_with_cats"=>"", "notes"=>"Lucky is a sweet girl who loves to be out with her K9 carers meeting new people and other dogs.\r\n\r\nLucky knows her basic commands, she will sit, give paw and loves lots of fuss.\r\n\r\nThis stunning girl loves to play fetch, she is excellent at catch.  Lucky will leave the toy on command and patiently wait for you to throw.\r\n\r\nIf you can offer Lucky a forever home, please contact our Birmingham Centre.", "status"=>"AVAIL", "smallphotolink"=>"38250 sml.jpg", "largephotolink"=>"38250 lrg.jpg", "featured"=>"0", "featureddog"=>"1", "deleted"=>"0", "force_image_update"=>"0", "checksum"=>"94e5df08cc2c81302b30a63d3cb64367", "created_at"=>"2015-05-12 12:30:03", "updated_at"=>"2015-07-27 10:00:01"}




class BirminghamDogsHomeScraper


  @endpoint = "http://www.birminghamdogshome.org.uk/re-homing/filterdogs"
  @params = {
    breed: "Any",
    size: "Any",
    centre: "Any",
    gender: "Any"
  }

  @shelter = Shelter.find_by_name("Birmingham Dogs Home")

  def self.scrape
    response = RestClient.post @endpoint, @params

    json = JSON.parse(response)

    dogs = []
    json.each do |entry|
      dogs << self.parse_dog(entry)
    end

    dogs.each(&:save)
  end

  def self.parse_dog(json)
    dog = self.get_dog(json["id"])
    
    dog.breed = Breed.find_or_create_by name: json["breed"]
    dog.size = json["size"]
    dog.name = json["dog_name"]
    dog.is_female = json["gender"].downcase=="female" ? true : false
    dog.age_string = json["age"]
    dog.home_tested = json["home_tested"]
    dog.child_friendly = json["child_suitability"]
    dog.description = json["notes"]
    dog.status = json["status"]
    dog.image_url = self.get_image_url(json["largephotolink"])
    dog.date_added = json["created_at"]
    dog.shelter = @shelter
    return dog
  end

  def self.get_dog(id)
    return Dog.find_or_initialize_by shelter_url: "http://www.birminghamdogshome.org.uk/re-homing/dogs/#{id}"
  end

  def self.get_image_url(filepath)
    return "http://www.birminghamdogshome.org.uk/uploads/dogs/#{filepath}"
  end

end
