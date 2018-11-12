require 'rails_helper'

RSpec.describe "login admin screen", :type => :request do

	it "logins an admin after click on login admin button" do
		visit "/login-administrador"
		fixtures :users
		# @admin = users(:admin)
		# fill_in 'email', with: @admin.email
		# puts("Password: #{@admin.password}")
		# fill_in 'password', with: @admin.password
	end
end