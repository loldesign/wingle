namespace :process_selection do
  desc "add some candidates to your selection process"
  task :select_some_candidates, [:company_id, :total_candidates] => :environment do |task, args|
    company = Company.find(args[:company_id])
    puts " ---> company found #{company.email}"

    candidates        = Candidate.complete.sample(args[:total_candidates].present? ? args[:total_candidates].to_i : 1)
    process_selection = ProcessSelectionManager::List.new(owner: company).active

    candidates.each do |candidate|
      puts "---> processing candidate #{candidate.name}"
      process_selection.candidate_process_selections.create(candidate_id: candidate.id) unless process_selection.candidate_process_selections.where(candidate_id: candidate.id).present?
    end

    puts "---> done"
  end

end
