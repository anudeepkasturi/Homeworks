# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

House.create!(address: "42 Wallaby Way, Sydney Australia")
Person.create!(name: "P. Sherman", house_id: 1)

House.create!(address: "0001 Cemetary Lane")
addams_house = House.find_by(address: "0001 Cemetary Lane")
Person.create!(name: "Wednesday Addams", house_id: addams_house.id)
Person.create!(name: "Cousin Itt", house_id: addams_house.id)
Person.create!(name: "Uncle Fester", house_id: addams_house.id)
Person.create!(name: "Gomez Addams", house_id: addams_house.id)
Person.create!(name: "Morticia Addams", house_id: addams_house.id)
