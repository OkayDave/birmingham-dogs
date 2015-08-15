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
    context "slug is not present" do
      before { @obj.slug = nil }

      it "returns the id as a string" do
        expect(@obj.to_param).to eq("#{@obj.id}")
      end

    end

    context "slug is present" do
      before { @obj.generate_slug }

      it "returns the slug" do
        expect(@obj.to_param).to eq(@obj.slug)
      end
    end
  end

  describe ".find" do
    context "when a number is passed" do
    
      it "finds the record with a valid id" do
        id = @obj.class.pluck(:id).first
        expect(@obj.class.find(id)).to be_an_instance_of(@obj.class)
      end

      it "raises an error with an invalid id" do
        id = 10000000
        expect{@obj.class.find(id)}.to raise_error(ActiveRecord::RecordNotFound)
      end


    end

    context "when a slug is passed" do
      
      it "finds the record with a valid slug" do
        x = @obj.class.first
        x.generate_slug
        expect(@obj.class.find(x.slug)).to be_an_instance_of(@obj.class)
      end

      it "raises and error with an invalid id" do
        slug = "X100X00000X-"
        expect{@obj.class.find(slug)}.to raise_error(ActiveRecord::RecordNotFound)      
      end

    end

  end

end
