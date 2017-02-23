class AuthenticationsController < Devise::SessionsController
  layout false

  def new
  end

  def after_sign_in_path_for(resource)
    my_clubs_path
  end
end
