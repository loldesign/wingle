class CandidateCurrentCompany < ApplicationRecord
	extend Enumerize

	belongs_to :candidate

	validate :months_between_jan_dec, :end_date_after_start_date, :accept_only_empty_or_all_present_dates

	enumerize :nationality, in: [:national, :multinational]

	def end_date_after_start_date
		return false unless dates_present? 
		
		if (start_date_year > end_date_year) || (start_date_year == end_date_year && start_date_month > end_date_month)
			errors.add(:start_date, "início não pode ser depois de fim")
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
		start_date_month.present? && start_date_year.present? && end_date_month.present? && end_date_year.present?
	end

	def dates_all_empty?
		start_date_month.nil? && start_date_year.nil? && end_date_month.nil? && end_date_year.nil?
	end

	def accept_only_empty_or_all_present_dates
		if !dates_all_empty?
			if start_date_month.nil?
				errors.add(:start_date_month, "Obrigatório")
			end
			if start_date_year.nil?
				errors.add(:start_date_year, "Obrigatório")
			end
			# only required if not currently_work_here
			if end_date_month.nil? && !currently_work_here
				errors.add(:end_date_month, "Obrigatório")
			end
			if end_date_year.nil? && !currently_work_here
				errors.add(:end_date_year, "Obrigatório")
			end
		end
	end
end
