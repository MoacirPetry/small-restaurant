class Customer < ApplicationRecord

  # Associations
  has_one :order

  # Validates
  validates :name, :email, :phone_number, presence: true, uniqueness: true
  validates :name, length: { maximum: 30, too_long: "-> %{count} characters is the maximum allowed", minimum: 2, too_short: "-> %{count} characters is the minimum allowed" }
  validates :email, length: { maximum: 100, too_long: "-> %{count} characters is the maximum allowed", minimum: 2, too_short: "-> %{count} characters is the minimum allowed" }
  validates :phone_number, length: { is: 10, wrong_length: "-> just exactly %{count} digits is allowed" }

end
