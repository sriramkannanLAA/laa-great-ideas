require 'rails_helper'

RSpec.describe "Users", type: :request do

  let(:default_user){
    User.create!(email: 'me@me.com', password: 'change_me')
  }

  let(:admin_user){
    User.create!(email: 'admin@me.com', password: 'change_me', admin: true)
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
    
    describe "requesting the show page" do
      it "redirects to the ideas page" do
        get user_path(default_user)
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
        get users_path(default_user)
        expect(response).to be_successful
        expect(response.body).to include('me@me.com')
        expect(response.body).to include('admin@me.com')
      end
    end

    describe "requesting the show page" do
      it "returns a success response" do
        get user_path(default_user)
        expect(response).to be_successful
        expect(response.body).to include('me@me.com')
      end
    end
  end

end