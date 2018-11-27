FactoryBot.define do
  factory :candidate do
    name      { Faker::Name.unique.name }
    email     { Faker::Internet.unique.free_email }
    cellphone { Faker::PhoneNumber.phone_number }
    cpf       { CPF.generate(fomatted: true) }
    employed  { [false, true].sample }
    password  { Faker::Internet.password(8) }

    trait :complete do
      candidate_interest {build(:candidate_interest)}
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
end
