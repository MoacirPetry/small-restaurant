class Table < ApplicationRecord

  # Associations
  has_one :order

  def self.ransackable_attributes(auth_object = nil)
    %w[created_at id limit status updated_at]
  end

  # Validates
  validates :limit, presence: true
  validates :status, inclusion: { in: [false] }
  validates :limit, numericality: { only_integer: true, greater_than_or_equal_to: 2, less_than_or_equal_to: 20 }
end
