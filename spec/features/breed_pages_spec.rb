
feature 'breed pages' do

  before(:all) do
    @breeds = []

    2.times do
      breed = FactoryGirl.create :breed
      FactoryGirl.create(:dog, breed: breed)
      @breeds << breed
    end
  end

  context "when visiting breed index page" do
    before { visit breeds_url }


    it "shows the right page" do
      expect(page).to have_content("Breeds")
    end

    it "lists the breeds" do
      @breeds.each do |breed|
        expect(page).to have_content(breed.name)
      end
    end

    context "each breed entry" do
      before do 
        @breed = @breeds.first
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
  


end
