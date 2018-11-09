FactoryBot.define do
	factory :judge do
		user
		department { rand(0..2) }
		name Faker::Name.name

		after :create do |p|
			p.user.role "judge"
		end
	end
end