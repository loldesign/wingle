class CandidateInterest < ApplicationRecord
  belongs_to :candidate

  validates :areas, presence: true

  validate :validate_areas
  def validate_areas
    if self.areas.present? && self.areas.first.nil?
      errors.add(:areas, "não pode ficar em branco")
      return false
    end
  end
end
