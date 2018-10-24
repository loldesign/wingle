class CompanyAbout < ApplicationRecord
	belongs_to :company

	# it will prevent saving array if view is changed
	# we can change it to a simple integer column instead array in future
	validate :ensure_one_sector, :ensure_one_neighborhood

	def ensure_one_sector
		if sectors.count > 1
			errors.add(:sectors, "escolha apenas um setor")
		end
	end

	def ensure_one_neighborhood
		if neighborhoods.count > 1
			errors.add(:neighborhoods, "escolha apenas uma região")
		end
	end
end
