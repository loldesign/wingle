class Company::FilterCandidateController < ApplicationController 
  def first
    @area = Area.all
  end

  def second
    @function = Function.all
  end

  def third
    @title_list = TitleList.order(priority: :asc)
  end

  def fourth
    @education_list = EducationList.all
    @language       = LanguageList.all
  end
end