class Order < ApplicationRecord

  # Associations
  belongs_to :customer
  belongs_to :user
  belongs_to :table
  has_many :order_products, inverse_of: :order
  has_many :products, through: :order_products

  # Nested attributes
  accepts_nested_attributes_for :order_products, allow_destroy: true

  def self.ransackable_attributes(auth_object = nil)
    %w[created_at customer_id id status table_id total updated_at user_id]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[customer table user]
  end

  # Validates
  validates :user, :customer, :table, presence: true

  # Calculate the total of prices in order
  def total_order(order)
    total = products.to_a.sum { |product| product.price }
    order.update(total: total)
    total
  end
end
