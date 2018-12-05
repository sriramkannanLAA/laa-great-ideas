# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Sign out', type: :system do
  let(:default_user) { create :user }

  describe 'as a logged in user' do
    it 'the sign out link should sign the user out' do
      sign_in default_user
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
