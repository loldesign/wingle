class Candidate < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :candidate_interest

  scope :by_sector      , -> (sector_id)       { joins(:candidate_interest).where("? = ANY (candidate_interests.sectors)", sector_id) }
  scope :by_company_size, -> (company_size_id) { joins(:candidate_interest).where("? = ANY (candidate_interests.company_sizes)", company_size_id) }
end
