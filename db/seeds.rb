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



