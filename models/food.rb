class Food < ActiveRecord::Base
	validates :name, :cuisine, :price, presence: true
	validates :name, uniqueness: true


	has_many :orders
	has_many :parties, :through => :orders
end