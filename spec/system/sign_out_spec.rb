# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Sign out', type: :system do
  before do
    @user = User.create!(email: 'me@justice.gov.uk', password: 'change_me')
  end

  describe 'as a logged in user' do
    it 'the sign out link should sign the user out' do
      sign_in @user
      visit ideas_path
      click_link 'Sign out'
      expect(page).to have_content 'Sign in to Great Ideas'
    end
  end

  describe 'as a logged out user' do
    it 'should not show a log out link' do
      visit ideas_path
      expect(page).not_to have_link('Sign out')
    end
  end
end
