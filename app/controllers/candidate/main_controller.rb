class Candidate::MainController < ApplicationController
  def home
    @header_options = {style: :dashboard_header}

    @menu_options = {style: :true}
  end
end