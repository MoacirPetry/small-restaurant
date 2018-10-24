class Order < ApplicationRecord
  belongs_to :customer
  belongs_to :user
  belongs_to :table

  # Validates
  validates :user, :customer, :table, presence: true

  # Calculate the total of prices in order
  # def total_order
  #   total = products.to_a.sum { |product| product.price }
  #   Order.update(total: total)
  #   total
  # end
end
