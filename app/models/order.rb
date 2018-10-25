class Order < ApplicationRecord

  # Associations
  belongs_to :customer
  belongs_to :user
  belongs_to :table
  has_many :order_products, inverse_of: :order
  has_many :products, through: :order_products

  # Nested attributes
  accepts_nested_attributes_for :order_products, allow_destroy: true

  # Validates
  validates :user, :customer, :table, presence: true

  # Calculate the total of prices in order
  def total_order
    total = products.to_a.sum { |product| product.price }
    Order.update(total: total)
    total
  end
end
