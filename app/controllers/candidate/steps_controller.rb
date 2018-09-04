class Candidate::StepsController < ApplicationController 
  def terms
    @header_options = {style: :with_logo_back_button}
  end

  def welcome_message
    @header_options = {style: :with_logo_back_button, back_button: false}
  end

  def first
    @header_options = {style: :with_logo_back_button}

    @city = City.all
  end

  def second
    @header_options = {style: :with_logo_back_button}

    @company_size = CompanySize.all
  end

  def third
    @header_options = {style: :with_logo_back_button}

    @sector = Sector.all
  end

  def fourth
    @header_options = {style: :with_logo_back_button}

    @mode = Mode.all
  end

  def fifth
    @header_options = {style: :with_logo_back_button}

    @relevance = Relevance.all
  end
end