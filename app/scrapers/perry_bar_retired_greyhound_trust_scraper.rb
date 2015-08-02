require 'open-uri'

class PerryBarRetiredGreyhoundTrustScraper

  @shelter = Shelter.find_by_name("Perry Bar Retired Greyhound Trust")
  @breed = Breed.find_or_create_by(name: "Greyhound")
  @home_url = "http://www.rgtperrybarr.co.uk/"
  @index_url = @home_url + "ourdogs"

  def self.scrape

    doc = Nokogiri::HTML(open(@index_url))

    entries = doc.css("ul.dogs li")
    
    entries.each do |entry|
      url = @home_url + entry.at_css("a.pic")["href"].strip

      dog = Dog.find_or_initialize_by shelter_url: url
      dog.shelter = @shelter
      dog.breed = @breed


      caption = entry.at_css(".caption").text.split(",")
      
      dog.name = caption[0].strip
      dog.age_string = caption[2].split(" ")[1].strip

      dog.is_female = (caption[1].strip == "female") ? true : false

      dog_page = Nokogiri::HTML(open(url))
      
      story_tags = dog_page.css(".story p")
      desc = ""

      story_tags.each do |tag|
        puts tag
        if tag["class"].blank?
          desc += tag.text.strip+"\n\n"  
        end
       
      end

      dog.description = desc

      image_path = dog_page.css("a.pic").first["href"].strip
      dog.image_url = @home_url + image_path

      dog.save

    end

  end


end
