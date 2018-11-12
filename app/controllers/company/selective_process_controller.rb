class Company::SelectiveProcessController < ApplicationController
  def index
    @header_options = {style: :company_full_header}
  end
end