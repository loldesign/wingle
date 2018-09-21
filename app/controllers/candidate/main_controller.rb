class Candidate::MainController < ApplicationController
  def home
    @header_options = {style: :dashboard_header}
  end

  def profile
    @header_options = {style: :dashboard_header}
  end
end