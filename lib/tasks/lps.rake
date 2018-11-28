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
      LPSCandidate.find_by(lps_key: lps_company.lps_key).each do |lps_candidate|
        LPS::Score.new(lps_candidate: lps_candidate, lps_company: lps_company).process

      end

    end
    puts "---> finished process at #{Time.now} "
  end


end
