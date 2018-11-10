FactoryBot.define do
	factory :user do
		sequence(:email) { |n| Faker::Internet.email }
		password 'password'
		password_confirmation 'password'
		role "admin"
	end
end