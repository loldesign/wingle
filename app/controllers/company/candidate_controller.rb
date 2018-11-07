class Company::CandidateController < ApplicationController 
  def profile
    @header_options = {style: :company_full_header}
  end
end