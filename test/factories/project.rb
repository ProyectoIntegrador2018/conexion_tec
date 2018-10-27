FactoryBot.define do
	factory :project do
		user(role: "project")
		status 0
		client rand(0..5)
		kind_id rand(0..19)
		field rand(0..8)
		abstract Faker::Lorem.sentence(5) 
		name Faker::Name.name
		video_url Faker::Internet.url
		professor_id 1
	end
end