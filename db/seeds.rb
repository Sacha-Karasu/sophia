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

babel = Room.new(name: "Babel", location: "21 rue Haxo, Marseille", start_date: start0, category: "Community", description: "C’est à Marseille, à deux pas du Vieux-Port, que la première résidence The Babel Community Marseille a vu le jour en Septembre 2017. Un lieu où l’on peut se loger, travailler, faire du sport, faire la fête, et surtout se rencontrer.", motion: false)
babel.user = maewenn
babel.save

longchamps = Room.new(name: "Opéra", location: "2 rue molière, Marseille", start_date: start1, category: "Voisin", description: "Très apprécié des locaux, encore méconnu des touristes, le quartier de Longchamp entre les Réformés et les Chartreux a tout du quartier urbain qu’on aime : des boutiques, des musées, des bars et restaurants, des galeries, des festivals de musique, et un grand espace vert pour petits et grands.", motion: false)
longchamps.user = claire
longchamps.save

cantoche = Room.new(name: "Cantoche", location: "13 rue haxo, Marseille", start_date: start2, end_date: end2, category: "Restaurant", description: "Pour la semaine des saveurs nous vous invitons à venir déguster tous les jours une spécialité française mise en valeur par notre cheffe.", motion: false)
cantoche.user = julia
cantoche.save

fete = Room.new(name: "Marianne", location: "12 rue Venture, Marseille", start_date: start3, end_date: end3, category: "Anniversaire", description: "C'est mon anniversaire. On va faire la teuf dans l'appart de mes vieux. Toute la street est invitée! Ramenez à boire bande de rats!!!", motion: false)
fete.user = marianne
fete.save

manifestation = Room.new(name: "Gilets Jaunes", location: "", start_date: start4, end_date: end4, category:"Manifestation", description: "ZBEUL PARTOUT ON AURA LA TETE A MACRON!!", motion: true)
manifestation.user = sacha
manifestation.save

theatre = Room.new(name: "Hamlet", location: "88 rue d'Aubagne, Marseille", start_date: start5, end_date: end5, category: "Théâtre", description: "La Tragique histoire d'Hamlet, prince de Danemark, plus couramment désigné sous le titre abrégé Hamlet, est la plus longue et l'une des plus célèbres pièces de William Shakespeare. La date exacte de sa composition n'est pas connue avec précision ; la première représentation se situe sûrement entre 1598 et 1601", motion: false)
theatre.user = sophia
theatre.save

# [babel, longchamps].each do |attributes|
#   room = Room.create!(attributes)
#   puts "Created #{room.name}"
# end
puts "Finished!"
