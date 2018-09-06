class Candidate::MainController < ApplicationController
  def home
    @header_options = {style: :dashboard_header}
  end
end