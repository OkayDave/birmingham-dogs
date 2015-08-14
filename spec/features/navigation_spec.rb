

feature 'navigation' do
  before do
    visit root_url
    @links = ["Home", "Find a Dog", "Birmingham Dog Shelters", "Breeds List"] 
  end

  it "show all the links" do
    @links.each do |link|
      expect(page).to have_link(link)
    end

  end
  
  it "links to dogs page" do
    click_link "Find a Dog"
    expect(page.current_url).to include("/dogs")
  end

  it "links to shelters page" do
    click_link "Birmingham Dog Shelters"
    expect(page.current_url).to include("/shelters")
  end

  it "links to breeds page" do
    click_link "Breeds List"
    expect(page.current_url).to include("/breeds")
  end



end
