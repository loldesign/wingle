class Candidate::HabilityController < ApplicationController
  def first
    @area = Area.all
  end
end