module Lps
	class Match < Base
		def initialize(options={})

			super(options)
			@lps_candidate = options[:lps_candidate]
      		@lps_company   = options[:lps_company]

		end

		def process
			#binding.pry
			scores = Lps::Score.new(lps_candidate: @lps_candidate, lps_company: @lps_company).process
			persist(build_match(scores))

		end

		private 
		
		def build_match(scores)
			
			item = {
						cpf_candidate:  @lps_candidate.cpf,
						cpf_cnpj_company:  @lps_company.cpf_cnpj,
						relevance:  @lps_candidate.relevance,
						locale_score:  scores[:locale],
						port_score:  	scores[:port],
						sector_score:  scores[:sector],
						score:  scores[:total_score],
						lps_company_key:  @lps_company.lps_key,
						lps_candidate_key: @lps_candidate.lps_key
					}
		end

		def persist(item)
			begin
        	  puts "---> processing item #{item[:cpf_cnpj_company]}"
	
        	  LpsMatch.find_or_create_by(item)
        	rescue Exception => e
	        	  puts "---> [ERROR] processing cpf #{item[:cpf_cnpj_company] and key item[:lps_company_key]}"
        	end
		end

	end
end

# ---------------
# How to use
# ---------------
# Lps::Match.new(lps_candidate: LpsCandidate.first, lps_company: LpsCompany.first).process
