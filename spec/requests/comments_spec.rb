# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Comments', type: :request do
  context 'As a logged in user' do
    before do
      @user = User.create!(email: 'me@justice.gov.uk', password: 'change_me')
      @idea = @user.ideas.create!(title: 'An idea to comment on')
      sign_in @user
    end

    describe 'GET /comments' do
      it 'returns a list of comments' do
        @user.comments.create!(body: 'Comment 1', idea_id: @idea.id)
        @user.comments.create!(body: 'Comment 2', idea_id: @idea.id)
        get comments_path
        expect(response.body).to include('Comment 1')
        expect(response.body).to include('Comment 2')
      end
    end

    describe 'POST /comments' do
      it 'creates a new comment' do
        expect do
          post comments_path, params: { comment: { body: 'Test comment', idea_id: @idea.id, user_id: @user.id } }
        end.to change(Comment, :count).by(1)
      end

      it 'only allows comments with user and ideas referenced' do
        post comments_path, params: { comment: { body: 'Test comment' } }
        expect(response.body).to include('prohibited this comment from being saved:')
      end
    end

    describe 'GET /comments/new' do
      it 'returns the new comment page' do
        get new_comment_path
        expect(response.body).to include('New Comment')
      end
    end

    describe 'GET /comment/:id' do
      it 'shows the comment' do
        comment1 = @user.comments.create!(body: 'Comment 1', idea_id: @idea.id)
        get comment_path(comment1)
        expect(response.body).to include('Comment 1')
      end
    end

    describe 'DELETE /comment' do
      it 'deletes the comment' do
        comment1 = @user.comments.create!(body: 'Comment 1', idea_id: @idea.id)
        delete comment_path(comment1)
        expect(Comment.exists?(comment1.id)).to eq false
      end
    end

    describe 'PATCH /comment' do
      it 'updates a comment' do
        comment1 = @user.comments.create!(body: 'Comment 1', idea_id: @idea.id)
        patch comment_path(comment1), params: { comment: { body: 'Changed comment' } }
        comment1.reload
        expect(comment1.body).to eq('Changed comment')
      end

      it 'fails to updates a comment if parameters missing' do
        comment1 = @user.comments.create!(body: 'Comment 1', idea_id: @idea.id)
        expect { patch comment_path(comment1) } .to raise_error(ActionController::ParameterMissing)
      end
    end
  end

  context "As user who isn't logged in" do
    describe 'GET /comment' do
      it 'redirects to the login page' do
        get comments_path
        expect(response).to redirect_to user_session_path
      end
    end
  end
end
