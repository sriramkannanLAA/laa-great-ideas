# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Add a comment', type: :system do
  before do
    @user = User.create!(email: 'me@justice.gov.uk', password: 'change_me')
    @idea = @user.ideas.create!(
      title: 'Assign idea',
      area_of_interest: 0,
      business_area: 0,
      it_system: 0,
      idea: 'Idea',
      benefits: 0,
      impact: 'Impact',
      involvement: 0
    )
  end

  context 'a logged in user' do
    before do
      sign_in @user
    end

    describe 'on the idea show page' do
      it 'can click an add comment button' do
        visit idea_path(@idea)
        click_on 'Add Comment'
        expect(page).to have_text('New Comment')
      end
    end

    describe 'creating a comment' do
      it 'can create and save a comment' do
        visit new_comment_path(@idea)
        expect(page).to have_text('New Comment')
        fill_in('comment_body', with: 'Test comment')
        click_on 'Create Comment'
        expect(page).to have_text('Test comment')
      end

      it 'does not create a comment when blank' do
        visit new_comment_path(@idea)
        expect(page).to have_text('New Comment')
        click_on 'Create Comment'
        expect(page).to have_text('prohibited this comment from being saved')
      end
    end

    describe 'editing a comment' do
      it 'can edit and save a comment' do
        comment1 = @user.comments.create!(body: 'Comment 1', idea_id: @idea.id)
        visit edit_comment_path(comment1)
        expect(page).to have_text('Comment 1')
        fill_in('comment_body', with: 'Test comment')
        click_on 'Update Comment'
        expect(page).to have_text('Test comment')
      end

      it 'does not edit a comment when blank' do
        comment1 = @user.comments.create!(body: 'Comment 1', idea_id: @idea.id)
        visit edit_comment_path(comment1)
        expect(page).to have_text('Comment 1')
        fill_in('comment_body', with: '')
        click_on 'Update Comment'
        expect(page).to have_text('prohibited this comment from being saved')
      end
    end
  end
end
