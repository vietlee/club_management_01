class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :set_locale
  include ApplicationHelper

  def user_signed_in
    unless user_signed_in?
      flash[:danger] = t("user.require_login")
      redirect_to new_user_session_url
    end
  end

  def current_user? user
    current_user == user
  end

  def correct_user
    @user = User.find_by id: params[:id]
    unless current_user?(@user)
      flash[:danger] = t("user.edit_require")
      redirect_to root_url
    end
  end

  def load_organization
    @organization = Organization.find_by id: params[:id]
    unless @organization
      flash[:danger] = t("cant_found")
      redirect_to root_url
    end
  end

  def admin_signed_in
    unless admin_signed_in?
      flash[:danger] = t("admin_require")
      redirect_to new_admin_sessions_path
    end
  end

  def create_acivity target, person_target, action
    unless Activity.create target: target,
      person_target: person_target, action: action
      flash_error t("create_activity_fails")
      redirect_to root_url
    end
  end

  private
  def set_locale
    I18n.locale = session[:locale] || I18n.default_locale
    session[:locale] = I18n.locale
  end
end
