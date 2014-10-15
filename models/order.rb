require_relative 'food'
require_relative 'party'
require 'pry'

class Order < ActiveRecord::Base
	belongs_to(:party)
  	belongs_to(:food)
	
	
	def to_s

	    self.food.name

	end

end