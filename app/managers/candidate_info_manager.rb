class CandidateInfoManager
  def initialize(options={})
    @candidate = options[:candidate]
  end

  def carrier_detailed
    @carrier ||= @candidate
                  .candidate_experience
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
end

# ---
# How to use
# ---
# CandidateInfoManager.new(candidate: Candidate.complete.last)
