require 'rails_helper'

RSpec.describe Package, type: :model do
  it { should validate_presence_of :order_id }
  it { should belong_to :order }

  it { should have_many :pastas_packages_relationships }
  it { should have_many :pastas }

end
