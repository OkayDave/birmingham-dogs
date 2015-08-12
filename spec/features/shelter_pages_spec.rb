
feature 'Shelter pages' do

  before(:all) do
    puts "before"
    @shelters = []
    2.times do
      shelter = FactoryGirl.create(:shelter)
      FactoryGirl.create(:dog, shelter: shelter)
      @shelters << shelter
    end

  end

  context "when visiting shelter index" do
    before { visit shelters_url }
  

    it "is the right page" do
      expect(page).to have_content("Birmingham Dog Shelters")
    end

    it "lists the shelters" do
      @shelters.each do |shelter|
        expect(page).to have_content(shelter.name)
      end
    end

    context "each shelter entry" do
      before { @element = find("div#shelter-#{@shelters.first.id}") }

      it "shows the shelter image" do
        expect(@element.find("img", match: :first)['src']).to eq(@shelters.first.image_url)
      end

      it "shows the shelter description" do
        expect(page).to have_css("div.shelter-description")
      end

      it "links to the shelter show page" do
        expect(page).to have_link("Details", shelter_url(@shelters.first))
      end
    end

  end

  context "when visiting shelter show page" do
    before do
      @shelter = @shelters.first
      visit shelter_url(@shelter)
      
    end

    it "shows the shelter name" do
      expect(page).to have_content("About #{@shelter.name}")
    end

    it "shows the shelter description" do
      expect(page).to have_css("div.shelter-description")
    end

    it "links to the shelter's website" do
      expect(page).to have_link("View Shelter's Website")
    end

    it "links to the shelter's contact information" do
      expect(page).to have_link("View Contact Details")
    end

    it "has a section for the shelter's dogs" do
      expect(page).to have_content("Dogs at #{@shelter.name}")
    end

    context "each dog on the list" do
      before do
        @dog = @shelter.dogs.first
        @dog_item = find("#dog-list-#{@dog.id}")
      end

      it "shows the dog's name" do
        expect(@dog_item.find("p", match: :first).text).to eq(@dog.name)
      end

      it "links to dog page" do
        expect(@dog_item.find("a", match: :first)['href']).to eq(dog_url(@dog))
      end

      it "shows dog image" do
        expect(@dog_item['style']).to include(@dog.image_url)
      end
    end



  end



end
