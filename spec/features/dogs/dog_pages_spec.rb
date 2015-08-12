

feature 'Dog pages' do

  before do 
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

    it "should list the dogs" do
      @dogs.each do |dog|
        expect(page).to have_content dog.name
      end
    end

    it "should show the dog image" do
      style = find(".dog-list-item", match: :first)['style']
      expect(style).to include("http://")
    end
  end

end
