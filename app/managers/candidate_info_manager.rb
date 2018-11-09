class CandidateInfoManager
  def initialize(options={})
    @candidate            = options[:candidate]
    @candidate_experience = @candidate.candidate_experience
  end

  def carrier_detailed
    @carrier ||= @candidate_experience
                  .title_experiences
                  .collect{|x| {
                                  title: TitleList.find(x.title_id).name,
                                  years: x.years,
                                  months: x.months
                                }}
  end

  def carrier_total_years
    carrier_detailed()

    yearsTotal  = @carrier.collect{|x| x[:years]}.sum
    monthsTotal = @carrier.collect{|x| x[:months]}.sum

    if(monthsTotal >= 12)
      monthsYear = (monthsTotal/12).floor
      restMonths = monthsTotal%12

      yearsTotal  = yearsTotal + monthsYear
      monthsTotal = restMonths
    end

    yearsTotal
  end

  def function_list
    Function.where(id: @candidate_experience.functions).collect{|x| x.name}
  end

  def company_list
    @candidate
      .candidate_companies
      .collect{|x| {name: x.name, size: CompanySize.find(x.size)}}
  end

  def language_list
    @candidate
      .candidate_education
      .candidate_education_languages
      .collect{|x| {name: x.language.name, level: x.language_level_id}}
  end

  def motivation_list
    interest = @candidate.candidate_interest

    {
      sectors: interest.sectors,
      modes: interest.modes,
      neighborhoods: interest.neighborhoods,
    }
  end

  def pretension_list
    pretension = @candidate.candidate_pretension

    {
      anual: pretension.total_pretended_from
    }
  end
end

# ---
# How to use
# ---
# CandidateInfoManager.new(candidate: Candidate.complete.last)
