require "rails_helper"

RSpec.describe "User admin", type: :system do

  before do
    @admin_user = User.create!(email:'me@justice.gov.uk', password: 'change_me', admin: true)
    sign_in @admin_user
  end

  describe "click the toggle admin button when user isn't an admin" do
    it "should set the user to be an admin" do
      user = User.create!(email: 'admin@justice.gov.uk', password: 'change_me', admin: false)
      visit user_path(user)
      click_button "Toggle Admin"
      user.reload
      expect(user.admin).to be true
      expect(page).to have_text("Admin status updated")
    end
  end

  describe "click the toggle admin button when user is an admin" do
    it "should set the user to not be an admin" do
      user = User.create!(email: 'admin@justice.gov.uk', password: 'change_me', admin: true)
      visit user_path(user)
      click_button "Toggle Admin"
      user.reload
      expect(user.admin).to be false
      expect(page).to have_text("Admin status updated")
    end
  end


end