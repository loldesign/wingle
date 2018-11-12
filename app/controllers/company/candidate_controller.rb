class Company::CandidateController < ApplicationController
  def profile
    @header_options = {style: :company_full_header}
    @candidate      =  Candidate.complete.sample
    @manager        =  CandidateInfoManager.new(candidate: @candidate)
  end
end
