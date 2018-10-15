require 'rails_helper'

RSpec.describe "Ideas", type: :request do

  describe "As a logged in user" do

    before do
      @user = User.create!(email:'me@me.com', password: 'change_me')
      sign_in @user
    end

    describe "GET /ideas" do
      it "works! (now write some real specs)" do
        get ideas_path
        expect(response).to have_http_status(200)
      end
    end

  end

  describe "As user who isn't logged in" do
    describe "GET /ideas" do
      it "works! (now write some real specs)" do
        get ideas_path
        expect(response).to have_http_status(302)
      end
    end
  end

end
