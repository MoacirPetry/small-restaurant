class Category < ApplicationRecord
  # Validates
  validates :name, presence: true, uniqueness: true, length: { maximum: 30, too_long: "-> %{count} characters is the maximum allowed", minimum: 2, too_short: "-> %{count} characters is the minimum allowed" }
  validates :description, presence: true, length: { maximum: 500, too_long: "-> %{count} characters is the maximum allowed", minimum: 10, too_short: "-> %{count} characters is the minimum allowed" }
end
