require 'rails_helper'

RSpec.describe "Users", type: :request do

  let(:default_user){
    User.create!(email: 'me@me.com', password: 'change_me')
  }

  let(:admin_user){
    User.create!(email: 'me@me.com', password: 'change_me', admin: true)
  }

  describe "as a default user" do
    before do
      sign_in default_user
    end

    describe "requesting the users index" do
      it "redirects to ideas page" do
        get users_path
        expect(response).to redirect_to(ideas_url)
      end
    end
  end

  describe "as an admin user" do
    before do
      sign_in admin_user
    end

    describe "requesting the users index" do
      it "returns a success response" do
        get users_path
        expect(response).to be_successful
        expect(response.body).to include('Users')
      end
    end
  end

end