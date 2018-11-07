class Table < ApplicationRecord

  # Associations
  has_one :order

  # Validates
  validates :limit, presence: true
  validates :status, inclusion: { in: [false] }
  validates :limit, length: { maximum: 2, too_long: "-> %{count} characters is the maximum allowed", minimum: 1, too_short: "-> %{count} characters is the minimum allowed" }
end
