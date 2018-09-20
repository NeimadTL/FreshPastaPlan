class Subscription < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :monthly_price, presence: true, numericality: { only_integer: true, greater_than: 0 }
  has_many :users_subs_relationships
  has_many :users, through: :users_subs_relationships

  def pasta_count_allowed
    return 2 if self.monthly_price == 15
    return 4 if self.monthly_price == 25
  end
end
