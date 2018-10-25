require "rails_helper"

RSpec.describe "Ideas submission", type: :system do

  before do
    @user = User.create!(email:'me@me.com', password: 'change_me')
    sign_in @user
  end

  describe "submitting an idea" do
    it "should set the submission date on an idea" do
      idea =  @user.ideas.create!(
        title: "Submit idea",
        area_of_interest: 0,
        business_area: 0,
        it_system: 0,
        idea: "Idea",
        benefits: 0,
        impact: "Impact",
        involvement: 0
      )
      visit idea_path(idea)
      click_button "Submit idea"
      idea.reload
      expect(idea.submission_date).to_not be_nil
      expect(page).to have_text("Idea was successfully submitted.")
    end
  end

  describe "submitting an idea with missing data" do
    it "should render the edit page with an error" do
      idea =  @user.ideas.create!(
        title: "Submit idea",
      )
      visit idea_path(idea)
      click_button "Submit idea"
      idea.reload
      expect(idea.submission_date).to be_nil
      expect(page).to have_text("prohibited this idea from being saved:")
    end
  end

end
