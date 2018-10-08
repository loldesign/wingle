class Company::AboutController < ApplicationController 
  def first
    @company_size = CompanySize.all
  end

  def second
    @sector = Sector.all
  end

  def third
    @mode = Mode.all
  end

  def fourth
    @city = City.all
  end
end