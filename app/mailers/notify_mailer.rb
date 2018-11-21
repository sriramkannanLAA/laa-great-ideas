# frozen_string_literal: true

class NotifyMailer < GovukNotifyRails::Mailer
  def email_template(user, template)
    set_template(template)
    mail(to: user.email)
  end
end
