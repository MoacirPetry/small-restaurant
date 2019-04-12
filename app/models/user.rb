class User < ApplicationRecord

  # Associations
  has_many :orders, dependent: :destroy

  # Positions
  enum position: { waiter: 0, waitress: 1, attendant: 2, cashier: 3, manager: 4, partner: 5, administrator: 6 }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :timeoutable, :timeout_in => 60.minutes
end
