require 'rails_helper'

RSpec.describe UsersSubsRelationship, type: :model do
  it { should validate_presence_of :user_id }
  it { should validate_presence_of :subscription_id }
end
