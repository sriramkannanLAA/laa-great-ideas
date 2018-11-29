# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Update status', type: :system do
  before do
    @user = User.create!(email: 'me@justice.gov.uk', password: 'change_me')
    @admin_user = User.create!(email: 'admin@justice.gov.uk', password: 'change_me', admin: true)
    @idea = @user.ideas.create!(
      title: 'Update status idea',
      area_of_interest: 0,
      business_area: 0,
      it_system: 0,
      idea: 'Idea',
      benefits: 0,
      impact: 'Impact',
      involvement: 0
    )
  end

  describe 'user updating an idea' do
    it 'should not be possible to update the status of the idea' do
      sign_in @user
      visit edit_idea_path(@idea)
      expect(page).not_to have_select('idea_status')
    end
  end

  describe 'admin user updating an idea' do
    it 'should be possible to update the status of the idea' do
      sign_in @admin_user
      visit edit_idea_path(@idea)
      expect(page).to have_select('idea_status')
      select 'Approved', from: 'idea_status'
      click_button 'Submit'
      @idea.reload
      expect(@idea.status).to eq('approved')
      expect(page).to have_text('Idea was successfully updated')
      visit ideas_path
      expect(page).to have_text('approved')
    end
  end
end
