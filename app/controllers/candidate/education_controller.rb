class Candidate::EducationController < ApplicationController
  def first
    @education_list = EducationList.all
  end

  def second
    @language = LanguageList.all
    @language_level = LanguageLevelList.all
  end
end