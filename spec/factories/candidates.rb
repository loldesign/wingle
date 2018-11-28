FactoryBot.define do
  factory :candidate do
    name      { Faker::Name.unique.name }
    email     { Faker::Internet.unique.free_email }
    cellphone { Faker::PhoneNumber.phone_number }
    cpf       { CPF.generate(fomatted: true) }
    employed  { [false, true].sample }
    password  { Faker::Internet.password(8) }

    trait :complete do
      signup_state              { :complete }
      candidate_interest        { build(:candidate_interest) }
      candidate_experience      { build(:candidate_experience) }
      candidate_current_company { build(:candidate_current_company) }
      candidate_hability        { build(:candidate_hability) }
      candidate_education       { build(:candidate_education) }
      candidate_pretension      { build(:candidate_pretension) }
    end
  end

  factory :candidate_interest do
    company_sizes { CompanySize.all.sample(1).map(&:id) }
    modes         { Mode.all.sample(1).map(&:id) }
    sectors       { Sector.all.sample(1).map(&:id) }
    relevances    { Relevance.all.sample(1).map(&:id) }
    cities        { [City.first.id] }
    areas         { Area.all.sample(1).map(&:id) }
    neighborhoods { Neighborhood.all.sample(3).map(&:id) }
  end

  factory :candidate_experience do
    areas                      { Area.all.sample(3).map(&:id) }
    functions                  { Function.all.sample(3).map(&:id) }
    disconsidered_functions    { [] }
    considered_functions       { Function.all.sample(4).map(&:id) }
    total_functions_percentage { 0 }
  end

  factory :candidate_current_company do
    name                { Faker::Company.name }
    start_date          { Faker::Date.between_except(2.year.ago, 1.year.ago, 1.year.ago) }
    end_date            { Faker::Date.between_except(6.months.ago, Date.today, Date.today) }
    company_size        { CompanySize.all.sample(1).map(&:id).first }
    sector              { Sector.all.sample(1).map(&:id).first }
    mode                { Mode.all.sample(1).map(&:id).first }
    city                { City.first.id }
    city_locale         { CityLocale.all.sample(1).map(&:id).first }
    neighborhood        { Neighborhood.all.sample(1).map(&:id).first }
    corporate_email     { Faker::Internet.email }
    currently_work_here { [false, true].sample }
  end

  factory :candidate_hability do
    habilities { Hability.all.sample(5).map(&:id) }
  end

  factory :candidate_education do
    degree { EducationList.all.sample(1).map(&:id).first }
  end

  factory :candidate_pretension do
    last_monthly_salary        { Faker::Number.number(4) }
    nofsalaries                { [12.0, 13.33].sample }
    variable                   { [1, 2, 5, 10, 20, 30, 40, 50].sample }
    last_salary_total          { Faker::Number.number(5) }
    pretension_minimum_percent { [30, 20, 10, 0, -10, -20, -30].sample }
    pretension_yearly_total    { Faker::Number.number(5) }
    benefits                   { CityLocale.all.sample(5).map(&:id) }
    minimum_claim              { Faker::Number.number(4) }
    bonus_or_plr               { nil }
    total_pretended_from       { nil }
  end
end
