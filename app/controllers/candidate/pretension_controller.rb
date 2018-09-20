class Candidate::PretensionController < ApplicationController
  def first
    @salary_list = NofsalariesList.all
  end

  def second
    @benefits = BenefitsList.all
  end

  def third
    @claim = AnnualClaimRateList.all
  end
end