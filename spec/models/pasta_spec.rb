require 'rails_helper'

RSpec.describe Pasta, type: :model do
  it { should validate_presence_of :name }
  it { should validate_uniqueness_of :name }

  it { should have_many :pastas_packages_relationships }
  it { should have_many :packages }
end
