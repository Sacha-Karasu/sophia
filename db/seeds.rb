# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


puts "Cleaning seeds"
Room.destroy_all
User.destroy_all
puts "Clean OK"

puts "Creating users..."
user1 = User.create!(email: "sacha@gmail.com", password: "sachasacha", nickname: "Sacha", category: "pro")

puts "Creating rooms..."

start1 = DateTime.new(2022, 11, 30, 12, 30)
end1 = DateTime.new(2022, 12, 3, 12, 30)

babel = Room.new(name: "Babel", location: "21 rue Haxo, Marseille", start_date: start1, end_date: end1, category: "workspace", description: "C’est à Marseille, à deux pas du Vieux-Port, que la première résidence The Babel Community Marseille a vu le jour en Septembre 2017. Un lieu où l’on peut se loger, travailler, faire du sport, faire la fête, et surtout se rencontrer.", motion: false)
babel.user = user1
babel.save

longchamps = Room.new(name: "Quartier Longchamps", location: "Boulevard du Jardin Zoologique, 13004 Marseille", start_date: start1, category: "neighborhood", description: "Très apprécié des locaux, encore méconnu des touristes, le quartier de Longchamp entre les Réformés et les Chartreux a tout du quartier urbain qu’on aime : des boutiques, des musées, des bars et restaurants, des galeries, des festivals de musique, et un grand espace vert pour petits et grands.", motion: false)
longchamps.user = user1
longchamps.save
# [babel, longchamps].each do |attributes|
#   room = Room.create!(attributes)
#   puts "Created #{room.name}"
# end
puts "Finished!"
