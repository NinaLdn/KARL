# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Cleaning DB..."

User.destroy_all
Car.destroy_all

puts 'Creating cars...'

user_test = User.new(
                  email: "manudecle@msn.com",
                  first_name: "Emmanuel",
                  last_name: "Dècle",
                  address: "10 rue portalis ",
                  password: "Password"

                )

user_test.save!



essence = Car.new(
                    user: user_test,
                    commercial_name: "206",
                    car_brand: "Peugeot",
                    year_of_production: Date.new(2001,2,3),
                    exact_kilometer: 125000,
                    fuel_type: "essence",
                    gearbox: "Manual",
                    location: "Paris",
                    estimated_price: 4000,
                    given_price: 4200

                )
essence.save!
puts 'Finished!'


