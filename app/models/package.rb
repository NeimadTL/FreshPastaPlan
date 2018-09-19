class Package < ApplicationRecord
  validates :order_id, presence: true
  belongs_to :order

  has_many :pastas_packages_relationships
  has_many :pastas, through: :pastas_packages_relationships
end
