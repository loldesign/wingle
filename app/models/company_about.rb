class CompanyAbout < ApplicationRecord
	belongs_to :company
	has_one :company_size
end
