class Order < ApplicationRecord
  belongs_to :customer
  belongs_to :user
  belongs_to :table

  # Validates
  validates :user, :customer, :table, presence: true
end
