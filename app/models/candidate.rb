class Candidate < ApplicationRecord
  include AASM

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :candidate_interest, dependent: :destroy

  scope :by_sector      , -> (sector_id)      { joins(:candidate_interest).where("? = ANY (candidate_interests.sectors)", sector_id) }
  scope :by_company_size, -> (company_size_id){ joins(:candidate_interest).where("? = ANY (candidate_interests.company_sizes)", company_size_id) }
  scope :by_locale      , -> (city_locale_id) { joins(:candidate_interest).where("? = ANY (candidate_interests.locales)", city_locale_id) }
  scope :by_mode        , -> (mode_id)        { joins(:candidate_interest).where("? = ANY (candidate_interests.modes)", mode_id) }
  scope :by_relevance   , -> (relevance_id)   { joins(:candidate_interest).where("? = ANY (candidate_interests.relevances)", relevance_id) }
  scope :by_city        , -> (city_id)        { joins(:candidate_interest).where("? = ANY (candidate_interests.cities)", city_id) }
  scope :by_area        , -> (area_id)        { joins(:candidate_interest).where("? = ANY (candidate_interests.areas)", area_id) }

  aasm :column => :signup_state, :logger => Rails.logger do
    state :interest, initial: true
    state :experience, :companies, :habilities, :education, :pretention, :complete

    event :completed_interest do
      transitions from: :interest, to: :experience
    end

    event :completed_experiences do
      transitions from: :experience, to: :companies
    end

    event :completed_companies do
      transitions from: :companies, to: :habilities
    end

    event :completed_habilities do
      transitions from: :habilities, to: :education
    end

    event :completed_education do
      transitions from: :education, to: :pretention
    end

    event :completed do
      transitions from: :pretention, to: :complete
    end
  end
end
