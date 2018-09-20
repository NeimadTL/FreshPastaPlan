class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :users_subs_relationship
  has_one :subscription, through: :users_subs_relationship

  has_many :orders

  def can_still_add_pasta?(last_order)
    last_order.package.pastas.count < self.subscription.pasta_count_allowed
  end
end
