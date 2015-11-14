require 'rails_helper'

RSpec.feature "Showing an Article" do

  before do
		@amala = User.create(email:"amalarails@gmail.com",password:"123456789")
		@article = Article.create(title:"The first article", body: "Body of first article",user: @amala)
  end
	scenario "A non-signed in user does not see Edit and Delete links" do
		visit "/"

		click_link @article.title
    expect(page).to have_content(@article.title)
    expect(page).to have_content(@article.body)
    expect(current_path).to eq(article_path(@article))

		expect(page).not_to have_link("Edit Article")
		expect(page).not_to have_link("Delete Article")
	end

		scenario "A non-owner signed in cannot see Edit and Delete links" do

		  login_as(@amala)
			visit "/"
			click_link @article.title

		expect(page).not_to have_link("Edit Article")
		expect(page).not_to have_link("Delete Article")

		end

	scenario "A signed in owner can see Edit and Delete links" do
     login_as(@amala)
		
			visit "/"
		
			click_link @article.title

		expect(page).to have_link("Edit Article")
		expect(page).to have_link("Delete Article")

		end


  scenario "Display individual article" do
    visit "/"

    click_link @article.title
    expect(page).to have_content(@article.title)
    expect(page).to have_content(@article.body)
    expect(current_path).to eq(article_path(@article))

  end

end