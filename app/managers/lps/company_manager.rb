module Lps
  class CompanyManager < Base
    def initialize(options={})
      super(options)

      @company = options[:company]
    end

    def process
      @info ||= info(@company)

      persist_lps(build_lps(@info))

      true
    end

    private

    def info(company)
      company_size = CompanySize.where(id: company.company_about.company_size_id).map(&:code).compact
      company_size = CompanySize.all.map(&:code).compact if company_size.first == "M"

      mode = Mode.where(id: company.company_about.mode_id).map(&:code).compact
      mode = Mode.all.map(&:code).compact if mode.first == "Md"

      OpenStruct.new({
        cpf_cnpj: company.cpf_cnpj,
        locale: Neighborhood.where(id: company.company_about.neighborhoods).map(&:code).compact,
        company_size: company_size,
        mode: mode,
        sector: Sector.where(id: company.company_about.sectors).map(&:code).compact
      })
    end

    def build_lps(result)
      begin
        array = []
        array_size_mode = []
        array_final = []

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
              cpf_cnpj: result.cpf_cnpj,
              locale: item.at(0),
              region: item.at(0).first,
              size: item.at(1).first,
              mode: item.at(1)[1..5],
              port: item.at(1),
              sector_key: item.at(2).first,
              sector: item.at(2),
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

          LpsCompany.create(item)
        rescue Exception => e
          puts "---> [ERROR] processing cpf #{item[:cpf] and key item[:lps_key]}"
        end

      end
    end
  end
end


# How to use
# ---
# Lps::CompanyManager.new(company: Company.last).process
