class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?, :auth_token

  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def login_user!(user)
    session[:session_token] = user.reset_session_token!
  end

  def logout!
    session[:session_token] = nil
    if current_user
      current_user.reset_session_token!
    end 
  end

  def logged_in?
    !!current_user
  end

  def auth_token
  "<input
    type='hidden'
    name='authenticity_token'
    value='#{form_authenticity_token}'
  />".html_safe
  end

end
