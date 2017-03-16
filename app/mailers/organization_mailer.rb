class OrganizationMailer < ApplicationMailer
  def mail_to_user_join user, organization
    @user = user
    @organization = organization
    @url = Settings.my_url
    mail to: @user.email, subject: t("request_mail")
  end

  def mail_to_user_admin_organization user, organization
    @user = user
    @organization = organization
    @url = Settings.my_url
    mail to: @user.email, subject: t("request_mail_organization")
  end

  def mail_to_club_request user, club
    @user = user
    @club = club
    @url = Settings.my_url
    mail to: @user.email, subject: t("request_mail_club_request")
  end
end
