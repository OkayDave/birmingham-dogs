require 'rails_helper'

RSpec.describe Breed, type: :model do
  before do
    @breed = FactoryGirl.create :breed
  end

  describe "#dog_image_url" do
    
    context "when an image_url is present" do
      before { @breed.image_url = "http://blah.com/img.png" }

      it "returns the correct image_url" do
        expect(@breed.dog_image_url).to eq(@breed.image_url)
      end

    end

    context "when an image_url is not present" do
      before do
        @breed.image_url = nil

      end

      context "when the breed has a dog" do
        before do
          @dog = FactoryGirl.create :dog, breed: @breed
        end

        it "returns the image of the dog" do
          expect(@breed.dog_image_url).to eq(@dog.image_url)
        end

        it "sets the breeds image_url to that dog image_url" do
          @breed.dog_image_url
          expect(@breed.image_url).to eq(@dog.image_url)
        end
      end

      context "when the breed does not have a dog" do 
        before { @new_breed = FactoryGirl.create :breed, image_url: nil }

        it "returns a blank string" do
          expect(@new_breed.dog_image_url).to eq("")
        end
      end
    
    end
  end
end
