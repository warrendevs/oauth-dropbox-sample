class ApplicationController < ActionController::Base
  before_filter :authenticate_dropbox

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def authorize
    redirect_to login_url, alert: "Not authorized" if current_user.nil?
  end

  def authenticate_dropbox
    redirect_to dropbox_path if dropbox.nil?
  end

  def dropbox
    if dropbox_enabled?
      Dropbox::API::Client.new({
        :token => dropbox_token,
        :secret => dropbox_secret
      })
    end
  end
  helper_method :dropbox

  def dropbox_enabled?
    dropbox_token && dropbox_secret
  end

  def dropbox_token
    session[:dropbox_token]
  end

  def dropbox_secret
    session[:dropbox_secret]
  end

end
