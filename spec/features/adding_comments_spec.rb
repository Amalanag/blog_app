require 'rails_helper'

RSpec.feature "Adding Reviews to Articles" do
	before do
		@amala = User.create(email: "amalarails@gmail.com", password: "123456789")
		@amu = User.create(email: "bondadaamala@gmail.com", password: "123456789")
		@article = Article.create(title: "The First Article", body: "body of first article" , user: @john)
	end

	scenario "permits signed in user to write a review" do
		login_as(@amu)

		visit "/"
		click_link @article.title
		fill_in "New Comment", with: "An awesome article"
		click_button "Add Comment"

		expect(page).to have_content("Comment has been created")
		expect(page).to have_content("An awesome article")
		expect(current_path).to eq(article_path(@article.comments.last.id))

		end
end
