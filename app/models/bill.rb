class Bill < ActiveRecord::Base

  belongs_to :shop
  has_many :products

  validates :buy_date, presence: true

	def amount
		amount = 0
		for product in self.products
			amount += product.price
		end
		return amount
	end
end
