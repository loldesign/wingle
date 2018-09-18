class Candidate::CompanyController < ApplicationController 
  def first
    
  end

  def second
    @size = CompanySize.all
    @sector = Sector.all
    @profile = TitleList.all
  end
end