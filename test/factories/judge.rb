FactoryBot.define do
	factory :project do
		user(role: "judge")
		department rand(0..2)
		name Faker::Name.name
	end
end