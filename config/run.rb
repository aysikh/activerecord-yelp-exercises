require_relative '../config/environment.rb'

#puts "Do any of these restaurants contain McDonalds"
# puts Restaurant.mcdonalds
#puts "What is the 10th restaurant?"
# puts Restaurant.tenth.name
#puts "What restaurant has a name longer than 12 characters?"
# puts Restaurant.with_long_names[0].name
#puts "What restaurant has the most # of dishes?"
# puts Restaurant.max_dishes.name
#puts "Find ALL restaurants has less than 5 dishes?"
# puts Restaurant.focused

# puts Restaurant.large_menu

# puts Restaurant.vegetarian.first.name

puts Restaurant.name_not_like("burger")

# binding.pry