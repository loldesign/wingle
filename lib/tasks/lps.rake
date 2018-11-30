namespace :lps do
  desc "generate all lps for completed candidates"
  task candidates: :environment do
    puts "---> started process at #{Time.now} "

    Candidate.complete.each do |candidate|
      Lps::CandidateManager.new(candidate: candidate).process
    end

    puts "---> finished process at #{Time.now} "
  end

  desc "generate all lps for completed companies"
  task companies: :environment do
    puts "---> started process at #{Time.now} "

    Company.all.each do |company|
      Lps::CompanyManager.new(company: company).process
    end

    puts "---> finished process at #{Time.now} "
  end

  desc "generate scores between LPSCandidate x LPSCompanies "
  task scores: :environment do
    puts "---> started process at #{Time.now} "

    LpsCompany.all.each do |lps_company|
      #LpsCandidate.where(lps_key: lps_company.lps_key).each do |lps_candidate|
      str_query = " lps_candidates.sector IN (?) OR "\
                  " lps_candidates.port IN (?) OR " \
                  " lps_candidates.mode IN (?) OR " \
                  " lps_candidates.locale IN (?) OR " \
                  " (lps_candidates.region) IN (?) OR " \
                  " lps_candidates.size IN (?) OR " \
                  " lps_candidates.sector_key IN ( ? ) "
      LpsCandidate.where([ str_query, lps_company.sector , lps_company.port , lps_company.mode, lps_company.locale ,lps_company.region, lps_company.size, lps_company.sector_key]).each do |lps_candidate|
        Lps::Match.new(lps_candidate: lps_candidate, lps_company: lps_company).process

      end

    end
    puts "---> finished process at #{Time.now} "
  end


end
