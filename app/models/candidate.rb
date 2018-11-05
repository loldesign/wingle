class Candidate < ApplicationRecord
  mount_uploader :candidate_avatar, ::CandidateAvatarUploader
  mount_uploader :candidate_curriculum, ::CandidateCurriculumUploader
  require "cpf_cnpj"
  include AASM

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :candidate_interest       , dependent: :destroy
  has_one :candidate_experience     , dependent: :destroy
  has_one :candidate_current_company, dependent: :destroy
  has_one :candidate_hability       , dependent: :destroy
  has_one :candidate_education      , dependent: :destroy
  has_one :candidate_pretension     , dependent: :destroy
  accepts_nested_attributes_for :candidate_interest
  validates_associated :candidate_interest

  has_many :candidate_companies, dependent: :destroy
  has_many :candidate_process_selections
  has_many :process_selections, through: :candidate_process_selections

  validates :name, :cpf, :cellphone, presence: true
  validates_uniqueness_of :cpf
  validates_length_of :cellphone, minimum: 14, maximum: 15, allow_blank: true

  scope :by_sector      , -> (sector_id)      { joins(:candidate_interest).where("? = ANY (candidate_interests.sectors)", sector_id) }
  scope :by_company_size, -> (company_size_id){ joins(:candidate_interest).where("? = ANY (candidate_interests.company_sizes)", company_size_id) }
  scope :by_locale      , -> (city_locale_id) { joins(:candidate_interest).where("? = ANY (candidate_interests.locales)", city_locale_id) }
  scope :by_mode        , -> (mode_id)        { joins(:candidate_interest).where("? = ANY (candidate_interests.modes)", mode_id) }
  scope :by_relevance   , -> (relevance_id)   { joins(:candidate_interest).where("? = ANY (candidate_interests.relevances)", relevance_id) }
  scope :by_city        , -> (city_id)        { joins(:candidate_interest).where("? = ANY (candidate_interests.cities)", city_id) }
  scope :by_area        , -> (area_id)        { joins(:candidate_interest).where("? = ANY (candidate_interests.areas)", area_id) }

  scope :by_current_title, -> (title_id)      { joins(:candidate_experience).where("candidate_experiences.current_title = ?", title_id) }

  validate :validate_cpf
  def validate_cpf
    if self.cpf.present? && !CPF.valid?(self.cpf)
      errors.add(:cpf, :invalid)
      return false
    end
  end

  aasm :column => :signup_state, :logger => Rails.logger do
    state :interest, initial: true
    state :experience, :companies, :habilities, :education, :pretension, :complete

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
      transitions from: :education, to: :pretension
    end

    event :completed do
      transitions from: :pretension, to: :complete
    end
  end
end
