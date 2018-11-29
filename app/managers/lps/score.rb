module Lps
  class Score
    def initialize(options={})
      @lps_candidate = options[:lps_candidate]
      @lps_company   = options[:lps_company]
    end

    def process

      total = {
        locale: calculate_locale(),
        port: calculate_port(),
        sector: calculate_sector(),
        #total_score: total_score
      }
      total_score =  total[:locale] + total[:port] + total[:sector]
      total_score = 4 if total_score > 4

      total.merge({total_score: total_score})
     
    end

    private

    def calculate_locale
      score = 0

      score = 0.5 if @lps_company.region == @lps_candidate.region
      score = 1   if @lps_company.locale == @lps_candidate.locale

      if @lps_candidate.relevance == 'L'
        score = score * 2
      end

      score
    end

    def calculate_sector
      score = 0

      score = 0.5 if @lps_company.sector_key == @lps_candidate.sector_key
      score = 1   if @lps_company.sector == @lps_candidate.sector

      if @lps_candidate.relevance == 'P'
        score = score * 2
      end

      score
    end

    def calculate_port
      score = 0

      score = 0.5 if @lps_company.size == @lps_candidate.size
      score = 0.5 if @lps_company.mode == @lps_candidate.mode
      score = 1   if @lps_company.port == @lps_candidate.port

      if @lps_candidate.relevance == 'S'
        score = score * 2
      end

      score
    end
  end
end

# ---------------
# How to use
# ---------------
# Lps::Score.new(lps_candidate: LpsCandidate.first, lps_company: LpsCompany.first).process
