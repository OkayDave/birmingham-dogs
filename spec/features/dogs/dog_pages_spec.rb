

feature 'Dog pages' do

  before do 
    Dog.all.each(&:destroy)
    @dogs = []
    5.times do 
      @dogs << FactoryGirl.create(:dog)
    end
  end


  context 'visiting dogs index' do
    before do
      visit dogs_path
    end
    
    it "has the right title" do  
      expect(page).to have_content 'Find a Dog'
    end

    it "lists the dogs" do
      @dogs.each do |dog|
        expect(page).to have_content dog.name
      end
    end

    context ".dog-list-item" do
      before do
        @element = find(".dog-list-item", match: :first)
      end
      
      it "shows the dog's image" do
        expect(@element['style']).to include("http://")
      end

      it "link's to the dog page" do
        expect(@element.find("a")['href']).to include("http://")
      end
    end
  end


  context 'visiting dogs show' do
    
    before do
      @dog = @dogs.first
      visit dog_path(@dog)
    end


    it "has a link back to index" do 
      expect(page).to have_link("← Back to Dogs", href: dogs_url)
    end

    it "shows the dog's name" do
      expect(page).to have_content(@dog.name)
      save_and_open_page
    end

    it "shows the dog's image" do
      expect(page).to have_css("img[src$='#{@dog.image_url}']")
    end

    it "shows the dog's description" do
      expect(page).to have_css("div.dog-description")
    end

    it "has link to shelter website" do
      expect(page).to have_link("View Full Details", @dog.shelter_url)
    end

    it "links to breed show page" do
      expect(page).to have_link(@dog.breed.name)
    end

    it "links to shelter show page" do
      expect(page).to have_link(@dog.shelter.name)
    end


  end



end
