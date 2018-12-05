# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User admin', type: :system do
  let(:admin_user) { create :admin }
  let(:admin_user2) { create :admin, email: 'admin2@justice.gov.uk' }
  let(:default_user) { create :user }

  before do
    sign_in admin_user
  end

  describe "click the toggle admin button when user isn't an admin" do
    it 'should set the user to be an admin' do
      visit user_path(default_user)
      click_button 'Toggle Admin'
      default_user.reload
      expect(default_user.admin).to be true
      expect(page).to have_text('Admin status updated')
    end
  end

  describe 'click the toggle admin button when user is an admin' do
    it 'should set the user to not be an admin' do
      visit user_path(admin_user2)
      click_button 'Toggle Admin'
      admin_user2.reload
      expect(admin_user2.admin).to be false
      expect(page).to have_text('Admin status updated')
    end
  end
end
