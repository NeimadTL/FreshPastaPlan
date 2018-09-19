require 'rails_helper'

RSpec.describe PastasPackagesRelationship, type: :model do
  it { should validate_presence_of :pasta_id }
  it { should validate_presence_of :package_id }

  it { should belong_to :pasta }
  it { should belong_to :package }
end
