require 'rails_helper'

RSpec.describe "Users", type: :request do

  let(:default_user){
    User.create!(email: 'me@justice.gov.uk', password: 'change_me')
  }

  let(:admin_user){
    User.create!(email: 'admin@justice.gov.uk', password: 'change_me', admin: true)
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
        expect(response.body).to include('me@justice.gov.uk')
        expect(response.body).to include('admin@justice.gov.uk')
      end
    end

    describe "requesting the show page" do
      it "returns a success response" do
        get user_path(default_user)
        expect(response).to be_successful
        expect(response.body).to include('me@justice.gov.uk')
      end
    end

    describe "toggle admin" do

      it "updates to true if currently false" do
        user = User.create!(email: 'test@justice.gov.uk', password: 'change_me', admin: false)
        post user_toggle_admin_path(user)
        user.reload
        expect(user.admin).to be true
        expect(response).to redirect_to(user_url(user))
      end

      it "updates to false if currently true" do
        user = User.create!(email: 'test@justice.gov.uk', password: 'change_me', admin: true)
        post user_toggle_admin_path(user)
        user.reload
        expect(user.admin).to be false
        expect(response).to redirect_to(user_url(user))
      end
    end

  end

end