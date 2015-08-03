require 'open-uri'

class AnimalAllsortsScraper

  @index_url = "http://rescuedogs.org.uk/dog-rescues/west-midlands/animal-allsorts"
  @shelter = Shelter.find_by_name("Animal Allsorts")

  def self.scrape
    doc = Nokogiri::HTML(open(@index_url))
    dogs = []

    doc.css("a.slide-image").each do |entry|
      url = entry["href"]
      dog = self.parse_dog(url)
      dog.image_url = entry.at_css("img")["src"]

      dogs << dog

    end

    dogs.each(&:save)
  end

  def self.get_dog(url)
    return Dog.find_or_initialize_by shelter_url: url
  end

  def self.parse_dog(url)
    dog = self.get_dog(url)

    dog_page = Nokogiri::HTML(open(url))
    dog.name = dog_page.at_css("h1.post-title").text.strip
    dog.description = dog_page.at_css(".entry-content p").text.strip
    dog.status = "Available"    
    dog.shelter = @shelter

    details = dog_page.css("table tr:last a")

    dog.breed = Breed.find_or_create_by name: details[0].text.strip
    dog.is_female = (details[2].text.strip=="Female") ? true : false
    dog.age_string = details[3].text.strip

    return dog


  end

end
