require 'rails_helper'

RSpec.feature "Deleting an Article" do

	before do
		amala = User.create(email: "amalarails@mail.com", password: "123456789")
		login_as(amala)
		@article = Article.create(title: "First article" ,body: "Body of first article " ,user: 
			amala)
	end
	scenario "A user deletes an article" do

	visit "/"

		click_link @article.title
		click_link "Delete Article"

		expect(page).to have_content("Article has been deleted")
		expect(current_path).to eq(articles_path)
	end
end


