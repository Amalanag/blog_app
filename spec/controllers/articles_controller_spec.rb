require 'rails_helper'
require 'support/macros'

RSpec.describe ArticlesController, type: :controller do

	describe "GET #edit" do
		before do
			@amala = User.create(email: "bondadaamala@gmail.com",password: "123456789")
		end

		context "owner is allowed to edit his articles" do
			it "renders the edit template" do
			login_user @amala
			article = Article.create(title: "first article", body: "body of first article" , user: @amala)

			get :edit, id: article
			expect(response).to render_template :edit
		end
	end

	context "non-owner is not allowed to edit other users articles" do
		it "redirects to the root path" do
			amu = User.create(email: "bondadaamala@gmail.com",password: "123456789")
			login_user amu

			article = Article.create(title: "First article", body: "body of first article", user: @amala)

			get :edit, id: article
			expect(response).to redirect_to(root_path)
			message = "You can only edit your own article."
			expect(flash[:danger]).to eq message
		 end
	 end

      it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

end
