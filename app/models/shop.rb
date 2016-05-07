class Shop < ActiveRecord::Base

	has_many :bills

	validates :name, presence: true, length: { minimum: 3 }

	
	def amount
		amount = 0
		for bill in self.bills
			amount += bill.amount
		end
		return amount
	end
end
