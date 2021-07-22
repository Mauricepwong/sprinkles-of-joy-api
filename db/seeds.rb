# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
topics = ['Booking', 'Question', 'Complaint', 'Other']
 
if Topic.all.length == 0
    topics.each do |topic|
        Topic.create(name: topic)
    end
end

if User.all.length == 0 
    User.create(
        username:  "test",
        email: "test@test.com",
        password:              "password",
        password_confirmation: "password",
        first_name: "first",
        middle_name: "middle",
        last_name: "last"
    )
    User.create(
        username:  "test2",
        email: "test2@test2.com",
        password:              "password",
        password_confirmation: "password",
        first_name: "first2",
        middle_name: "middle2",
        last_name: "last2"
    )
end
  
if Enquiry.all.length == 0
    Enquiry.create(user_id: 1, name: "Enquiry1-1", contact: "0411111111", topic_id: 1, message: "User 1 - this is a test message")
    Enquiry.create(user_id: 1, name: "Enquiry1-2", contact: "0411111111", topic_id: 2, message: "User 1 - this is a test message")
    Enquiry.create(user_id: 2, name: "Enquiry2-1", contact: "0411111111", topic_id: 3, message: "User 2 - this is a test message")
    Enquiry.create(user_id: 2, name: "Enquiry2-1", contact: "0411111111", topic_id: 4, message: "User 2 - this is a test message")
end

if Cake.all.length == 0
    Cake.create(
        name: "Rainbow Cake",
        description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor",
        ingredients: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor",
    ).image.attach(io: File.open(Rails.root.join('public', 'images', 'rainbow.jpg')), filename: 'rainbow.jpg')
    Cake.create(
        name: "Chocolate Cake",
        description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor",
        ingredients: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor",
    ).image.attach(io: File.open(Rails.root.join('public', 'images', 'chocolate.jpg')), filename: 'chocolate.jpg')
    Cake.create(
        name: "Cupcakes",
        description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor",
        ingredients: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor",
    ).image.attach(io: File.open(Rails.root.join('public', 'images', 'cupcakes.jpg')), filename: 'cupcakes.jpg')
    Cake.create(
        name: "Vanilla Cake",
        description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor",
        ingredients: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor",
    ).image.attach(io: File.open(Rails.root.join('public', 'images', 'vanilla.jpg')), filename: 'vanilla.jpg')
    Cake.create(
        name: "Velvet Cake",
        description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor",
        ingredients: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor",
    ).image.attach(io: File.open(Rails.root.join('public', 'images', 'velvet.jpg')), filename: 'velvet.jpg')
    Cake.create(
        name: "Donuts",
        description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor",
        ingredients: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor",
    ).image.attach(io: File.open(Rails.root.join('public', 'images', 'donut.jpg')), filename: 'donut.jpg')

end



