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
sacha = User.create!(email: "sacha@gmail.com", password: "sachasacha", nickname: "Sacha", category: "pro")
claire = User.create!(email: "claire@gmail.com", password: "claireclaire", nickname: "Claire", category: "non-pro")
julia = User.create!(email: "julia@gmail.com", password: "juliajulia", nickname: "Julia", category: "pro")
marianne = User.create!(email: "marianne@gmail.com", password: "mariannemarianne", nickname: "Marianne", category: "non-pro")
sophia = User.create!(email: "sophia@gmail.com", password: "sophiasophia", nickname: "Sophia", category: "pro")
bahar = User.create!(email: "bahar@gmail.com", password: "baharbahar", nickname: "Bahar", category: "non-pro")
maewenn = User.create!(email: "maewenn@gmail.com", password: "maewennmaewenn", nickname: "Maewenn", category: "pro")
ciel = User.create!(email: "ciel@gmail.com", password: "cielciel", nickname: "cielrooftop", category: "pro")

puts "Creating rooms..."

start0 = DateTime.new(2022, 10, 06, 12, 30)
start1 = DateTime.new(2022, 11, 15, 12, 30)

start2 = DateTime.new(2022, 12, 8, 9, 30)
end2 = DateTime.new(2022, 12, 15, 12, 30)

start3 = DateTime.new(2022, 12, 9, 19, 00)
end3 = DateTime.new(2022, 12, 10, 19, 00)

start4 = DateTime.new(2022, 12, 9, 13, 30)
end4 = DateTime.new(2022, 12, 9, 23, 30)

start5 = DateTime.new(2022, 12, 10, 19, 00)
end5 = DateTime.new(2022, 12, 10, 23, 30)

end6 = DateTime.new(2022, 12, 16, 23, 30)

opera = Room.new(name: "Quartier Opéra", location: "2 rue molière, Marseille", start_date: start1, category: "Voisins", description: "Apprécié des touristes et peuplé par les locaux, le quartier Opéra à 2 pas du Vieux Port a tout du quartier urbain qu’on aime : des boutiques, des musées, des bars et restaurants, des galeries, des festivals de musique, et la mer toute proche.", motion: false)
opera.user = claire
opera.save

silo = Room.new(name: "Le Silo xx Izia", location: "25 Boulevard Jacques Saadé Quai Du Lazaret, 13002 Marseille", start_date: start5, end_date: end5, category:"Concert", description: "Izïa signe son grand retour cette année avec son cinquième album attendu cet été, un retour tout aussi réjouissant pour son public que salvateur pour elle.", motion: false)
silo.user = julia
silo.save

theatre = Room.new(name: "Hamlet", location: "88 rue d'Aubagne, Marseille", start_date: start5, end_date: end5, category: "Théâtre", description: "La Tragique histoire d'Hamlet, prince de Danemark, plus couramment désigné sous le titre abrégé Hamlet, est la plus longue et l'une des plus célèbres pièces de William Shakespeare. La date exacte de sa composition n'est pas connue avec précision ; la première représentation se situe sûrement entre 1598 et 1601", motion: false)
theatre.user = sacha
theatre.save

velodrome = Room.new(name: "Orange vélodrome - Rugby France / Afrique du Sud", location: "3 Boulevard Michelet, 13008 Marseille, France", start_date: start5, end_date: end5, category: "Match", description: "Un véritable choc des titans pour ce match qui opposera la france à l'afrique du sud ce samedi. on se retrouve nombreux pour profiter de cette rencontre exceptionnelle en vue de la prochaine coupe du monde !", motion: false)
velodrome.user = sacha
velodrome.save

demo = Room.new(name: "Demo Day Le Wagon Marseille", location: "21 rue Haxo, 13001 Marseille, France", start_date: start4, end_date: end5, category: "Evènementt pro", description: "L'aboutissement de 9 semaines de travail acharné c'est maintenant ! Découvrons tous les projets web et data de cette session d'Automne.", motion: false)
demo.user = ciel
demo.save

puts "Finished!"
