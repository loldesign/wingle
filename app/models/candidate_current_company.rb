class CandidateCurrentCompany < ApplicationRecord
	belongs_to :candidate

	validate :months_between_jan_dec
	validate :end_date_after_start_date

	def end_date_after_start_date
		if dates_present?
			if start_date_year > end_date_year
				errors.add(:start_date_year, "início não pode ser depois de fim")
			elsif start_date_year == end_date_year && start_date_month > end_date_month
				errors.add(:start_date_month, "início não pode ser depois de fim")
			end
		end
	end

	def months_between_jan_dec
		if start_date_month.present? && (start_date_month > 12 || start_date_month < 1)
			errors.add(:start_date_month, "inválido")
		end

		if end_date_month.present? && (end_date_month > 12 || end_date_month < 1)
			errors.add(:end_date_month, "inválido")
		end
	end

	def dates_present?
		start_date_year.present? && end_date_year.present? && start_date_month.present? && end_date_month.present?
	end
end
