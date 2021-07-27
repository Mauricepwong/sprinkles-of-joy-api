require 'rails_helper'

RSpec.describe Cake, type: :model do
  it "should be a Cake" do
    expect(subject).to be_a_kind_of(Cake)
  end
  
  describe "attributes" do
    it "should respond to #name" do
      expect(subject).to respond_to :name
    end
  
    it "should respond to #description" do
      expect(subject).to respond_to :description
    end
  
    it "should respond to #ingredients" do
      expect(subject).to respond_to :ingredients
    end
  
    it "should respond to #image" do
      expect(subject).to respond_to :image
    end
  end
  
  describe "validation" do
    it "name is present" do
      cake = Cake.new(
        description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor",
        ingredients: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor"
      ).save
      expect(cake).to eq(false)
    end
  
    it "cake creation" do
      cake = Cake.new(
        name: "Rainbow Cake",
        description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor",
        ingredients: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor"
      ).save
      expect(cake).to eq(true)
    end
  end
 end
  
 
