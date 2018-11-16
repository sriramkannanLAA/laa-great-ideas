require 'rails_helper'

RSpec.describe NotifyMailer, type: :mailer do
  describe 'Email' do
    let(:user) { double('User', name: 'Test Name', email: 'test@justice.gov.uk') }
    let(:template) { '2561a8b1-244e-41cf-90ab-51dc27d08966' }
    let(:mail) { described_class.email_template(user, template) }

    it 'is a govuk_notify delivery' do
      expect(mail.delivery_method).to be_a(GovukNotifyRails::Delivery)
    end

    it 'sets the recipient' do
      expect(mail.to).to eq(['test@justice.gov.uk'])
    end

    it 'sets the body' do
      expect(mail.body).to match("This is a GOV.UK Notify email with template #{template}")
    end

    it 'sets the template' do
      expect(mail.govuk_notify_template).to eq(template)
    end
  end
end
