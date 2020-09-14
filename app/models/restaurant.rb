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





end