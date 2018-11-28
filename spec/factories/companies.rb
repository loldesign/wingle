FactoryBot.define do
  factory :company do

 	email 					{ Faker::Internet.unique.free_email }
 	password 				{ Faker::Internet.password(8) }
 	created_at				{ DateTime.now }
 	updated_at				{ DateTime.now }
 	cpf_cnpj				{ CNPJ.generate(fomatted: true) }

    trait :complete do
       company_about {build(:company_about)}
    end   
  end

  factory :company_about do 	

  	created_at			{ DateTime.now }
 	updated_at			{ DateTime.now }
	company_size_id 	{ CompanySize.all.sample(1).map(&:id).first.to_i }
	mode_id 			{ Mode.all.sample(1).map(&:id).first.to_i }
	sectors 			{ Sector.all.sample(1).map(&:id) }
	neighborhoods 		{ Neighborhood.all.sample(1).map(&:id) }
 
  end

end