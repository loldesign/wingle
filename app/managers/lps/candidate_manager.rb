module Lps
  class CandidateManager < Base
    def initialize(options={})
      super(options)

      @candidate = options[:candidate]
    end

    def process
      @info ||= info(@candidate)

      persist_lps(build_lps(@info))

      true
    end

    private

    def info(candidate)
      company_size = CompanySize.where(id: candidate.candidate_interest.company_sizes).map(&:code).compact
      company_size = CompanySize.all.map(&:code).compact if company_size.first == "M"

      mode = Mode.where(id: candidate.candidate_interest.modes).map(&:code).compact
      mode = Mode.all.map(&:code).compact if mode.first == "Md"

      OpenStruct.new({
        cpf: candidate.cpf,
        name: candidate.name,
        locale: Neighborhood.where(id: candidate.candidate_interest.neighborhoods).map(&:code).compact,
        company_size: company_size,
        mode: mode,
        relevance: Relevance.where(id: candidate.candidate_interest.relevances).map(&:code),
        sector: Sector.where(id: candidate.candidate_interest.sectors).map(&:code).compact
      })
    end

    def build_lps(result)
      begin
        array = []
        array_size_mode = []
        array_final = []
        # REVIEW PORT CALCULATION
          result.company_size.each do |size|
            result.mode.each do |mode|
              array_size_mode << [size, mode]
            end
          end

          result.locale.each do |locale|
            result.sector.each do |sector|
              array << [locale, sector]
            end
          end

          array.each do |item|
            array_size_mode.collect{|x| x.join}.each do |item_size|
              array_final << [item.at(0), item_size, item.at(1)]
            end
          end

          array_final.collect do |item|
            {
              name: result.name,
              cpf: result.cpf,
              locale: item.at(0),
              region: item.at(0).first,
              size: item.at(1).first,
              mode: item.at(1)[1..5],
              port: item.at(1),
              sector_key: item.at(2).first,
              sector: item.at(2),
              relevance: result.relevance.first,
              lps_key: item
            }
        end
      rescue Exception => e
        puts "---> [ERROR] processing cpf #{result.cpf}"
      end
    end

    def persist_lps(list)
      list.each do |item|
        begin
          puts "---> processing item #{item[:lps_key]}"

          LpsCandidate.create(item)
        rescue Exception => e
          puts "---> [ERROR] processing cpf #{item[:cpf] and key item[:lps_key]}"
        end

      end
    end
  end
end


# How to use
# ---
# Lps::CandidateManager.new(candidate: Candidate.first).process
