FactoryBot.define do
	factory :project do
		user
		status 0
		client { rand(0..5) }
		expertise_area_id { rand(1..20) }
		field { rand(0..8) }
		abstract Faker::Lorem.sentence(5) 
		name Faker::Name.name
		video_url Faker::Internet.url
		professor_id 1
		category_id { rand(1..4) }

		after(:create) do |p|
			p.user.role "project"
		end
	end
end