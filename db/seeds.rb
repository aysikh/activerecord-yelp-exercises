Restaurant.destroy_all
Dish.destroy_all
Tag.destroy_all
DishTag.destroy_all


restaurant_name = ["McDonalds", "Burger King", "White Castle", "Whataburger", "In-and-Out", "Arby's", "Five Guys", "Smashburger", "Shake Shack", "Wendy's", "Silver Diner", "IHOP", "Denny's", "Pizza Hut", "Domino's", "Subway", "Cava", "Chipotle", "Moe's", "Yo Queiro Taco Bell"]

dish_names = (1..200).to_a
dish_names = dish_names.map do |num|
  num.to_s
end

tag_names = ["Spicy", "Vegetarian", "Paleo", "Organic", "Gluten Free", "Grass Fed", "GMO Free", "Keto", "Vegan", "Contains Peanuts"]

tag_names.each do |name|
  tag = Tag.create
  tag.update(name: name)
end

dish_names.each do |name|
  dish = Dish.create
  dish.update(name: name)
  3.times do 
    dishtag = DishTag.create
    dishtag.update(dish: dish, tag: Tag.all.sample)
  end
end

restaurant_name.each do |name|
  restaurant = Restaurant.create
  restaurant.update(name: name)
  10.times do
    single_dish = Dish.find_by(restaurant: nil)
    single_dish.update(restaurant: restaurant)
  end
end

burger = Dish.create
burger.update(name: "Burger", restaurant: Restaurant.find_by(name: "Chipotle"))

chickfila = Restaurant.new
chickfila.update(name: "Chick-fil-A")
dish1 = Dish.new 
dish1.update(name: "Dish", restaurant: chickfila)

dishtag = DishTag.new
dishtag.update(dish: dish1, tag: Tag.find_by(name: "Vegetarian"))