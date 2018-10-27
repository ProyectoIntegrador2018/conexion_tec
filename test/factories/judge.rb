FactoryBot.define do
	factory :judge do
		user(role: "judge")
		department rand(0..2)
		name Faker::Name.name
	end
end