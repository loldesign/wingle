class Subsector < ApplicationRecord
  belongs_to :sector
  validates :name, :presence => true
end
