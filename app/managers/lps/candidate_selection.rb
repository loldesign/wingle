module Lps
  class CandidateSelection
    def initialize(options={})
      @company = options[:company]
    end

    def process
      LpsCandidate.where(region: region_code).each do |lps_candidate|
        puts "processing #{lps_candidate.cpf} with key #{lps_candidate.lps_key.join}"

        lps_company.each do |lps_company|
          score = Lps::Score.new(lps_candidate: lps_candidate, lps_company: lps_company).process

          LpsMatch.create(
            cpf_candidate: lps_candidate.cpf,
            cpf_cnpj_company: lps_company.cpf_cnpj,
            relevance: lps_candidate.relevance,
            locale_score: score[:locale],
            port_score: score[:port],
            sector_score: score[:sector],
            score: score[:total],
            lps_company_key: lps_company.lps_key.join,
            lps_candidate_key: lps_candidate.lps_key.join
          )
        end
      end
    end

    private

    def region_code
      Neighborhood.find(@company.company_about.neighborhoods.first).city_locale.code
    end

    def lps_company
      LpsCompany.where(cpf_cnpj: @company.cpf_cnpj)
    end
  end
end


# LpsMatch.where(cpf_cnpj_company: co.cpf_cnpj).where('score > ?', 2.0).where(cpf_candidate: '775.973.753-01').order(score: :asc).limit(10).collect{|x| puts "#{x.lps_candidate_key} | #{x.lps_company_key} | #{x.score} | #{x.cpf_cnpj_company} | #{x.cpf_candidate}"}
# LpsMatch.where(cpf_cnpj_company: co.cpf_cnpj).collect{|x| puts "#{x.lps_candidate_key} | #{x.lps_company_key} | #{x.score} | #{x.cpf_cnpj_company} | #{x.cpf_candidate}"}

# LpsMatch.where(cpf_cnpj_company: co.cpf_cnpj).select(:cpf_candidate).distinct.collect{ |x| puts x.cpf_candidate}

# worked listed candidates max score
# LpsMatch.where(cpf_cnpj_company: co.cpf_cnpj).select(:cpf_candidate).distinct.collect{ |x| LpsMatch.where(cpf_candidate: x.cpf_candidate).select(:score).max.collect{ |y| puts y.score}}
