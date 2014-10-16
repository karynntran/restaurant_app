class Party < ActiveRecord::Base
	has_many(:orders)
	has_many(:foods, :through => :orders)

	class AddNewFoodforPaid < StandardError
  	end

  	def add_food_for_paid
		if self.paid == true
			raise AddNewFoodforPaid, "This party has already left"
		end	
	end

	def subtotal
		total = 0
		self.orders.each do |order|
			total += order.food.price
		end
		total
	end

	def one_gratuity
		(self.subtotal.to_i * 0.15).to_i
	end

	def two_gratuity
		(self.subtotal.to_i * 0.18).to_i
	end

	def three_gratuity
		(self.subtotal.to_i * 0.20).to_i
	end


end