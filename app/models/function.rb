class Function < ApplicationRecord
	validates :name, :presence => true
	belongs_to :area
	has_many :habilities

	scope :by_areas   , -> (areas) { joins(:area).where("areas.id IN (?)", areas) }
	scope :by_ids_list, -> (ids)   { where("id IN (?)", ids) }
end
