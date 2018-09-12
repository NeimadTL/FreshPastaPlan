require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_one :users_subs_relationship }
end
