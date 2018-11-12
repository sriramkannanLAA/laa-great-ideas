require "rails_helper"

RSpec.describe "Assign idea", type: :system do

  before do
    @user = User.create!(email:'me@me.com', password: 'change_me')
    @admin_user = User.create!(email:'admin@me.com', password: 'change_me', admin: true)
    @idea =  @user.ideas.create!(
        title: "Submit idea",
        area_of_interest: 0,
        business_area: 0,
        it_system: 0,
        idea: "Idea",
        benefits: 0,
        impact: "Impact",
        involvement: 0
      )   
  end

  describe "user creating an idea" do
    it "should not be possible to assign the idea" do
      sign_in @user      
      visit edit_idea_path(@idea)
      expect(page).not_to have_select('idea_assigned_user_id')
    end
  end

  describe "admin user submitting an idea" do
    it "should be possible to assign the idea" do
      sign_in @admin_user
      visit edit_idea_path(@idea)
      expect(page).to have_select('idea_assigned_user_id')
      first('#idea_assigned_user_id option').select_option
      click_button "Update Idea"
      @idea.reload
      expect(@idea.assigned_user_id) == @user.id
      expect(page).to have_text('Idea was successfully updated')
    end
  end

end
