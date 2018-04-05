
class SignupMailer < ActionMailer::Base
  default :from => 'no-reply@colcho.net'

  def confirm_email(user)
    @user = user
    @confirmation_link = "http://127.0.0.1:3000/"

    mail({
        :to => user.email,
        :bcc => ['sign ups <signups@colcho.net>'],
        :subject => I18n.t('signup_mailer.confirm_email.subject')
         })
  end
end