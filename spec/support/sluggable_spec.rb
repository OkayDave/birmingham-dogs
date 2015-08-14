require "rails_helper"

shared_examples_for "sluggable" do
  let(:model) { described_class }

  before do
    @obj = FactoryGirl.create(model.to_s.underscore.to_sym)
  end
  
  
  describe "#generate_slug" do

    context "when slug is undefined" do 
      before { @obj.slug = nil }

      it "generates a new slug" do
        @obj.generate_slug
        expect(@obj.slug).to_not be_blank
      end
    end

    context "when slug is present" do
      before { @obj.slug = "lol" }

      it "does nothing" do
        @obj.generate_slug
        expect(@obj.slug).to eq("lol")
      end
    end


      
    it "correctly generates the slug" do
      @obj.slug = nil
      @obj.generate_slug
      if @obj.is_a?(Shelter)
        expect(@obj.slug).to eq("#{@obj.name} ".parameterize)
      else
        expect(@obj.slug).to eq("#{@obj.name} #{@obj.id}".parameterize)
      end
    end


  end

  describe "#to_param" do

  end

  describe ".find" do


  end

end
