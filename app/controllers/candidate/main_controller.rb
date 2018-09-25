class Candidate::MainController < ApplicationController
  def home
    @header_options = {style: :dashboard_header}
    @tab_bar        = {style: :with_tab_bar}
  end

  def profile
    @header_options = {style: :dashboard_header}
    @tab_bar        = {style: :with_tab_bar}
  end
end