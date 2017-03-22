class AdminMailer < ApplicationMailer
  def mail_to_user_request user, organization
    @user = user
    @organization = organization
    @url = Settings.my_url
    mail to: @user.email, subject: t("request_open_organization")
  end
end
