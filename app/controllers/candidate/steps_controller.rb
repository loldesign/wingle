class Candidate::StepsController < ApplicationController 

  def terms
    @header_options = {style: :with_logo_back_button}
  end

  def welcome_message
    @header_options = {style: :with_logo_back_button, back_button: false}
  end

  def first
    @header_options = {style: :with_logo_back_button}
  end

  def second
    @header_options = {style: :with_logo_back_button}
  end

  def third
    @header_options = {style: :with_logo_back_button}
  end

  def fourth
    @header_options = {style: :with_logo_back_button}
  end

  def fifth
    @header_options = {style: :with_logo_back_button}
  end

end