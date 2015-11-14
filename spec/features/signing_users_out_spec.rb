require 'rails_helper'

RSpec.feature "Signning Out signed-in users" do

	before do
		@amala = User.create!(email:"amalarails@gmail.com" , password: "123456789")
		visit "/"

		click_link "Sign in"
		fill_in "Email", with: @amala.email
		fill_in "Password", with: @amala.password
		click_button "Log in"
	end

	scenario do
		visit "/"
		click_link "Sign out"
		expect(page).to have_content("Signed out successfully.")
	end
end

