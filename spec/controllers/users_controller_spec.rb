require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  let(:default_user){
    User.create!(email: 'me@me.com', password: 'change_me')
  }

  let(:admin_user){
    User.create!(email: 'me@me.com', password: 'change_me', admin: true)
  }

  let(:valid_session) { {} }

  describe "as a default user" do
    before do
      sign_in default_user
    end

    describe "GET #index" do
      it "redirect to ideas page" do
        get :index, session: valid_session
        expect(response).to redirect_to(ideas_url)
      end
    end
  end

  describe "as an admin user" do
    before do
      sign_in admin_user
    end

    describe "GET #index" do
      it "returns a success response" do
        get :index, session: valid_session
        expect(response).to be_successful
      end
    end
  end

end
