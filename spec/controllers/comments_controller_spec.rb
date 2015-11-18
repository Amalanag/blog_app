require 'rails_helper'
require 'support/macros'

RSpec.describe CommentsController, type: :controller do
	describe "POST #create" do
		before do
			@amala = User.create(email: "amalarails@gmail.com" , password: "123456789")
		end

		context "signed in user" do
			it "can create a comment" do
				login_user @amala
				article = Article.create(title: "First Article",
					body: "Body of first article",
					user: @amala)
				post :create, comment:{body: "Awesome post"},
				article_id: article.id
				expect(flash[:success]).to eq("Comment has been created")
			end
		end

		context "non-signed in user" do
			it "is redirected to the sign in page" do
				login_user nil
				article = Article.create(title: "First Article",
					body: "Body of first article",
					user: @amala)
				post :create, comment:{body: "Awesome post"},
				article_id: article.id
				expect(response).to redirect_to new_user_session_path
			end
		end
	end
end
