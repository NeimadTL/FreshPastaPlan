class PastasPackagesRelationship < ApplicationRecord
  validates :pasta_id, presence: true
  validates :package_id, presence: true
  belongs_to :pasta
  belongs_to :package
end
