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

	def subtotal
		food = Food.all
	    foodprices = food.map do |food|
	    	food.price
	    end

	    totalprice = foodprices.inject do |sum, food|
			sum + food
		end

		totalprice.to_i
	end

	def gratuity
	    (self.subtotal * 0.20).to_i
	end

	def total_sum
	    (self.gratuity + self.subtotal).to_i
	end

end