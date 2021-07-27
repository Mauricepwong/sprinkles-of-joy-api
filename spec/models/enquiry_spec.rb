require 'rails_helper'

RSpec.describe Enquiry, type: :model do
  it "should be a Enquiry" do
    expect(subject).to be_a_kind_of(Enquiry)
  end
  
  describe "attributes" do
    it "should respond to #name" do
      expect(subject).to respond_to :name
    end
  
    it "should respond to #contact" do
      expect(subject).to respond_to :contact
    end
  
    it "should respond to #message" do
      expect(subject).to respond_to :message
    end
  
    it "should respond to #topic" do
      expect(subject).to respond_to :topic
    end
  end
 end
  
 
 