require_relative 'food'
require_relative 'party'
require 'pry'

class Order < ActiveRecord::Base
	belongs_to(:party)
  	belongs_to(:food)
	
	def food_name
	    self.food.name
	end

	def food_price
	    "$" + (self.food.price).to_s
	end

	# def total_sum
	#     sum = self.inject {|sum,order|sum + self.food.price }
	# end

end