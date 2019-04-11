class Table < ApplicationRecord

  # Associations
  has_one :order

  # Validates
  validates :limit, presence: true
  validates :status, inclusion: { in: [false] }
  validates :limit, numericality: { only_integer: true, greater_than_or_equal_to: 2, less_than_or_equal_to: 20 }
end
