class Product < ApplicationRecord

  # Associations
  belongs_to :category

  def self.ransackable_attributes(auth_object = nil)
    %w[category_id created_at description id name price updated_at]
  end

  # Validates
  validates :name, presence: true, uniqueness: true, length: { maximum: 30, too_long: "-> %{count} characters is the maximum allowed", minimum: 2, too_short: "-> %{count} characters is the minimum allowed" }
  validates :description, presence: true, length: { maximum: 500, too_long: "-> %{count} characters is the maximum allowed", minimum: 2, too_short: "-> %{count} characters is the minimum allowed" }
  validates :category, presence: true
end
