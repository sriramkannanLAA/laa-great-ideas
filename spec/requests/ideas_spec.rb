require 'rails_helper'

RSpec.describe "Ideas", type: :request do

  describe "As a logged in user" do

    before do
      @user = User.create!(email:'me@me.com', password: 'change_me')
      sign_in @user
    end

    describe "GET /ideas" do
      it "should show a list of ideas" do
        @user.ideas.create!(title: "New idea1")
        @user.ideas.create!(title: "New idea2")
        get ideas_path
        expect(response).to have_http_status(200)
        expect(response.body).to include "New idea1"
        expect(response.body).to include "New idea2"

      end
    end

    describe "POST /ideas" do
      it "should create a new idea" do
        expect {
          post ideas_path, params: { idea: { title: "Test title"}}
        }.to change(Idea, :count).by(1)

        expect(response).to have_http_status(302)
      end
    end

  end

  describe "As user who isn't logged in" do
    describe "GET /ideas" do
      it "redirects to the login page" do
        get ideas_path
        expect(response).to redirect_to user_session_path

      end
    end
  end

end
