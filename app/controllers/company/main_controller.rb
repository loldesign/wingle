class Company::MainController < ApplicationController
  before_action :load_process_selection

  def home
  end

  def profile
    @header_options = {style: :company_full_header}
  end

  private
  def load_process_selection
    @process_selection = ProcessSelectionManager::List.new(owner: current_company).active
  end
end
