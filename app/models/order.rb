class Order < ApplicationRecord
<<<<<<< HEAD

  # Associations
  belongs_to :customer
  belongs_to :user
  belongs_to :table
  has_many :order_products, inverse_of: :order
  has_many :products, through: :order_products

  # Nested attributes  
  accepts_nested_attributes_for :order_products, allow_destroy: true
=======
  belongs_to :customer
  belongs_to :user
  belongs_to :table
>>>>>>> product

  # Validates
  validates :user, :customer, :table, presence: true
end
