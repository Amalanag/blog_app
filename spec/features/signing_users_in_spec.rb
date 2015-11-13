require 'rails_helper'

RSpec.feature "Users sign-in" do

	before do
		@amala=User.create!(email: "amalarails@gmail.com", password: "123456789")
		end

	scenario "with valid credentials" do
	  visit "/"

	click_link "Sign in"
	fill_in "Email", with: @amala.email
	fill_in "Password", with: @amala.password
	click_button "Log in"

	expect(page).to have_content("Signed in successfully.")
	expect(page).to have_content("Signed in as #{@amala.email}")

 end
end