class Pasta < ApplicationRecord
  validates :name, presence: true, uniqueness: true
end
