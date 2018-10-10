class Company < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :company_about, dependent: :destroy

  scope :by_company_size, -> (company_size_id){ joins(:company_about).where("? = company_abouts.company_size_id", company_size_id) }
  scope :by_mode        , -> (mode_id)        { joins(:company_about).where("? = company_abouts.modes", mode_id) }
  scope :by_sector      , -> (sector_id)      { joins(:company_about).where("? = ANY (company_abouts.sectors)", sector_id) }
end
