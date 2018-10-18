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

    describe "update an idea" do
      it "should change an existing idea" do
        idea = @user.ideas.create!(title: "An idea")
        patch idea_path(idea), params: { idea: { title: "New Test title"}}
        idea.reload
        expect(idea.title).to eq ("New Test title")
      end
    end

    describe "delete an idea" do
      it "should delete an existing idea" do
        idea = @user.ideas.create!(title: "An idea to delete")
        delete idea_path(idea)
        expect(Idea.exists?(idea.id)).to eq false
      end
    end

    describe "submitting an idea with all data" do
      it "should set the submission date on an idea and all fields present" do
       idea =  @user.ideas.create!(
          title: "Submit idea",
          submission_date: Time.now,
          area_of_interest: 0,
          business_area: 0,
          it_system: 0,
          idea: "Idea",
          benefits: 0,
          impact: "Impact",
          involvement: 0
        )
        post idea_submit_path(idea)
        idea.reload
        expect(idea.submission_date).to_not be_nil 
        expect(idea.area_of_interest).to_not be_nil 
        expect(idea.business_area).to_not be_nil 
        expect(idea.it_system).to_not be_nil 
        expect(idea.title).to_not be_nil 
        expect(idea.idea).to_not be_nil 
        expect(idea.benefits).to_not be_nil 
        expect(idea.impact).to_not be_nil 
        expect(idea.involvement).to_not be_nil 
      end
    end 

    describe "submitting an idea with missing data" do
      it "should not set the submission date on an idea where fields are missing" do
        idea = @user.ideas.create!(
          title: "Submit idea",
          area_of_interest: 0,
          business_area: 0
        )
        post idea_submit_path(idea)
        expect(idea.submission_date).to be_nil
        expect(response.body).to include('prohibited this idea from being saved:')
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
