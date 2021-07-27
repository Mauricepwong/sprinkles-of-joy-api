require 'rails_helper'

RRSpec.describe User, type: :model do
  it "should be a User" do
    expect(subject).to be_a_kind_of(User)
  end
  
  describe "attributes" do
    it "should respond to #email" do
      expect(subject).to respond_to :email
    end
  
    it "should respond to #username" do
      expect(subject).to respond_to :username
    end
  
    it "should respond to #middle_name" do
      expect(subject).to respond_to :middle_name
    end
  
    it "should respond to #first_name" do
      expect(subject).to respond_to :first_name
    end
  
    it "should respond to #last_name" do
      expect(subject).to respond_to :last_name
    end
  
    it "should respond to #admin" do
      expect(subject).to respond_to :admin
    end
  end
  
  describe "Validation" do
    it "email is present" do
      user = User.new(
        username:  "test",
        password:              "password",
        password_confirmation: "password",
        first_name: "first",
        middle_name: "middle",
        last_name: "last"
      ).save
      expect(user).to eq(false)
    end
   
    it "username is present" do
      user = User.new(
        email: "test@test.com",
        password:              "password",
        password_confirmation: "password",
        first_name: "first",
        middle_name: "middle",
        last_name: "last"
      ).save
      expect(user).to eq(false)
    end
   
    it "first name is present" do
      user = User.new(
        email: "test@test.com",
        password:              "password",
        password_confirmation: "password",
        middle_name: "middle",
        last_name: "last"
      ).save
      expect(user).to eq(false)
    end
   
    it "passwords to match" do
      user = User.new(
        username:  "test",
        email: "test@test.com",
        password:              "password",
        password_confirmation: "pass",
        first_name: "first",
        middle_name: "middle",
        last_name: "last"
      ).save
      expect(user).to eq(false)
    end
  
    it "user creation" do
      user = User.new(
        username:  "test",
        email: "test@test.com",
        password:              "password",
        password_confirmation: "password",
        first_name: "first",
        middle_name: "middle",
        last_name: "last"
      ).save
      expect(user).to eq(true)
    end
  end
 end
 
