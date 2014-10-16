class Party < ActiveRecord::Base
	has_many(:orders)
	has_many(:foods, :through => :orders)

	def subtotal
		total = 0
		self.orders.each do |order|
			total += order.food.price
		end
		total
	end

	def gratuity
		(self.subtotal.to_i * 0.15).to_i
	end

	def total_cost
		(self.subtotal + self.gratuity).to_i
	end
end