require 'open-uri'

class WythallAnimalSanctuaryScraper


  @index_url = "http://wythallanimalsanctuary.org.uk/animal/dog/"
  @dog_url = "http://wythallanimalsanctuary.org.uk/animal/"
  @shelter = Shelter.find_by_name("Wythall Animal Sanctuary") 

  def self.scrape
    dogs = []
    begin 
      (1..2).each do |page_number|
        page = ""
        if page_number == 1
          page = @index_url
        else
          page = @index_url+"page/#{page_number.to_s}"
        end

        puts page
        doc = Nokogiri::HTML(open(page))

        rows = doc.css("table.gallery-table tr")

        puts rows.count
        rows.each do |row|
          
          row.css("td").each do |dog|
            if dog.at_css("a")
              url = dog.at_css("a")["href"]
              dogs << self.parse_dog(url)
            end
          end

        end
      end
      
    rescue Exception => e
      puts " "
      puts e.message
      puts " "
      puts e.backtrace
    ensure
      dogs.each(&:save) 
    end

 
  end


  def self.parse_dog(url)
    puts url
    html = Nokogiri::HTML(open(url))

    dog = self.get_dog(url)
    
    dog.shelter = @shelter
    dog.name = html.at_css("h1.page-title").text
    dog.image_url = html.at_css('#single-animal-image img')["src"]
    dog.description = html.at_css('.inner-content').css("p").last.text

    misc = self.parse_misc(html.at_css("#single-animal-details"))

    dog.is_female = misc["is_female"]
    dog.breed = Breed.find_or_create_by name: misc["breed"].strip
    dog.age_string = misc["age"]
    dog.status = misc["status"]

    return dog

  end

  def self.get_dog(url)
    return Dog.find_or_initialize_by shelter_url: url
  end

  def self.parse_misc(html)
    misc = {}

    gender_text = html.text.gsub(" ","").gsub("\n","").split.first.downcase.strip
    misc["is_female"] = gender_text=="female" ? true : false

    html.css("p").each do |line|
      kv = line.text.split(":")
      misc[kv[0].downcase] = kv[1].strip
    end

    return misc
  end

end
