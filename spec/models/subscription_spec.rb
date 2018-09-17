require 'rails_helper'

RSpec.describe Subscription, type: :model do
  it { should validate_presence_of :name }
  it { should validate_presence_of :monthly_price }
  it { should validate_numericality_of(:monthly_price).only_integer.is_greater_than(0) }
  it { should have_many :users_subs_relationships }
  it { should have_many :users }
end
