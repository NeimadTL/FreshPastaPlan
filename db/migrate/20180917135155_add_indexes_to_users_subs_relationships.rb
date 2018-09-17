class AddIndexesToUsersSubsRelationships < ActiveRecord::Migration[5.2]
  def change
    add_index :users_subs_relationships, :user_id
    add_index :users_subs_relationships, :subscription_id
    add_index :users_subs_relationships, [:user_id, :subscription_id], unique: true
  end
end
