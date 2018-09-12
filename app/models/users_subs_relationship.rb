class UsersSubsRelationship < ApplicationRecord
  validates :user_id, presence: true
  validates :subscription_id, presence: true
  belongs_to :user
  belongs_to :subscription
end
