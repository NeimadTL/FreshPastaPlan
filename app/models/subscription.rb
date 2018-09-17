class Subscription < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :monthly_price, presence: true, numericality: { only_integer: true, greater_than: 0 }
  has_many :users_subs_relationships
  has_many :users, through: :users_subs_relationships
end
