class Candidate::ExperienceController < ApplicationController
  def first
    @header_options = {style: :with_logo_back_button}

    @title_list = TitleList.all
  end

  def second
    @header_options = {style: :with_logo_back_button}

    @title_list = TitleList.all
  end

  def third
    @header_options = {style: :with_logo_back_button}

    @area = Area.all
  end

  def fourth
    @header_options = {style: :with_logo_back_button}

    @function = Function.all
  end

  def fifth
    @header_options = {style: :with_logo_back_button}

    @function = Function.all
  end

  def sixth
    @header_options = {style: :with_logo_back_button}

    @function = Function.all
  end

  def seventh
    @header_options = {style: :with_logo_back_button}

    @function = Function.all
  end
end