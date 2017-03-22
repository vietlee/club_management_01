class ClubMailer < ApplicationMailer
  def mail_to_user_manager_club user, club
    @user = user
    @club = club
    @url = Settings.my_url
    mail to: @user.email, subject: t("request_mail_club")
  end

  def mail_to_user_join_club user, club
    @user = user
    @club = club
    @url = Settings.my_url
    mail to: @user.email, subject: t("request_mail")
  end
end
