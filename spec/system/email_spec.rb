# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Email', type: :system do
  describe 'Send an email' do
    it 'should send a template email' do
      user = User.create!(email: 'test@digital.justice.gov.uk', password: 'change_me')
      template = '2561a8b1-244e-41cf-90ab-51dc27d08966'
      mail = NotifyMailer.email_template(user, template).deliver_now
      expect(mail.body).to have_text('This is a GOV.UK Notify email with template')
    end
  end
end
