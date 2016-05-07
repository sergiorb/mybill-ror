class Product < ActiveRecord::Base
	
  belongs_to :bill

  validates :name, presence: true, length: { minimum: 3 }
  validates :quantity, presence: true, :numericality => { :greater_than => 0 }
  validates :quantity_type, presence: true
  validates :price, presence: true, :numericality => { :greater_than => 0 }
end
