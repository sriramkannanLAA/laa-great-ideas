# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users', type: :request do
  let(:default_user) { create :user }
  let(:admin_user) { create :admin }

  describe 'as a default user' do
    before do
      sign_in default_user
    end

    describe 'requesting the users index' do
      it 'redirects to ideas page' do
        get users_path
        expect(response).to redirect_to(ideas_url)
      end
    end

    describe 'requesting the show page' do
      it 'redirects to the ideas page' do
        get user_path(default_user)
        expect(response).to redirect_to(ideas_url)
      end
    end

    describe 'sign out' do
      it 'signs the user out' do
        delete destroy_user_session_path
        expect(controller.current_user).to be_nil
      end
    end
  end

  describe 'as an admin user' do
    before do
      sign_in admin_user
    end

    describe 'requesting the users index' do
      it 'returns a success response' do
        get users_path(default_user)
        expect(response).to be_successful
        expect(response.body).to include('me@justice.gov.uk')
        expect(response.body).to include('admin@justice.gov.uk')
      end
    end

    describe 'requesting the show page' do
      it 'returns a success response' do
        get user_path(default_user)
        expect(response).to be_successful
        expect(response.body).to include('me@justice.gov.uk')
      end
    end

    describe 'toggle admin' do
      it 'updates to true if currently false' do
        post user_toggle_admin_path(default_user)
        default_user.reload
        expect(default_user.admin).to be true
        expect(response).to redirect_to(user_url(default_user))
      end

      it 'updates to false if currently true' do
        post user_toggle_admin_path(admin_user)
        admin_user.reload
        expect(admin_user.admin).to be false
        expect(response).to redirect_to(user_url(admin_user))
      end
    end
  end
end
