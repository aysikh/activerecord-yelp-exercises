class Restaurant < ActiveRecord::Base
  
  has_many :dishes

  def self.mcdonalds
    self.find_by(name: "McDonalds")
  end

  def self.tenth
    self.find(self.first.id + 9)
  end

  def self.with_long_names
    self.where("length(name) > 12")
  end

  def self.max_dishes
    self.find(Dish.group('restaurant_id').order('count(*) DESC').pluck(:restaurant_id).first)
  end

  def self.focused
    dish_array = Dish.having('count(restaurant_id) < 5').group('restaurant_id')
    if dish_array == []
      return nil
    else
      return dish_array.map do |dish_object|
        dish_object.restaurant
      end
    end
  end

  def self.large_menu
    dish_array = Dish.having('count(restaurant_id) > 20').group('restaurant_id')
    if dish_array == []
      return nil
    else
      return dish_array.map do |dish_object|
        dish_object.restaurant
      end
    end
  end

  def self.vegetarian 
    dish_tag_list = DishTag.where(tag: Tag.find_by(name: "Vegetarian"))
    dish_list = dish_tag_list.map do |single_dt| #all the veg dishes
      single_dt.dish
    end
    Restaurant.all.select {|restaurant|
      restaurant.dishes.all? {|dish|
        dish_list.include?(dish)
        }
      }
  end

  def self.name_like(name)
    self.where("name like ?", "%#{name}%")
  end

  def self.name_not_like(name)
    self.where("name not like ?", "%#{name}%")
  end

end