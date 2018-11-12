class Company::UserController < ApplicationController
  def profile
    @header_options = {style: :company_full_header}
  end
end