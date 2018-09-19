class Pasta < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :pastas_packages_relationships
  has_many :packages, through: :pastas_packages_relationships
end
