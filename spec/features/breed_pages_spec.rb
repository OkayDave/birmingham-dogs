
feature 'breed pages' do

  before(:all) do
    @breeds = []

    2.times do
      breed = FactoryGirl.create :breed
      FactoryGirl.create(:dog, breed: breed)
      @breeds << breed

      
      
    end

    @breed = @breeds.first
  end

  context "when visiting breed index page" do
    before(:context) { visit breeds_url }


    it "shows the right page" do
      expect(page).to have_content("Breeds")
    end

    it "lists the breeds" do
      @breeds.each do |breed|
        expect(page).to have_content(breed.name)
      end
    end

    context "each breed entry" do
      before(:context) do
        @element = find("div#breed-#{@breed.id}")    
      end

      it "shows the breed name" do
        expect(@element.find("p", match: :first).text).to eq(@breed.name)
      end

      it "shows the breed image" do
        expect(@element[:style]).to include(@breed.image_url)
      end

      it "links to breed page" do
        expect(@element.find("a", match: :first)['href']).to eq(breed_url(@breed)) 
      end

    end
  end


  context "when visiting breed show page" do
    before do
      @breed = @breeds.first
      visit breed_url(@breed)
    end

    it "shows the right page" do
      expect(page).to have_content @breed.name
    end

    it "lists the breed's dogs" do
      @breed.dogs.each do |dog|
        expect(page).to have_content(dog.name)
      end
    end 

    context "each dog entry" do
      before { @element = find("div#dog-list-#{@breed.dogs.first.id}") }

      it "shows the dog image" do
        expect(@element[:style]).to include(@breed.dogs.first.image_url)
      end

      it "links to dog page" do
        expect(page).to have_link @breed.dogs.first.name
      end
    end

  end
  


end
