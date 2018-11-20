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
end
