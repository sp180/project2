class ApplicationController < ActionController::Base
  before_action :authorize
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Method to look up the user, if they're logged in, and save their user object to a variable called @current_user.
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  # The helper_method below the method current_user allows us to use @current_user in our view files.
  helper_method :current_user

  # Authorize is for sending someone to the login page if they aren't logged in
  def authorize
    redirect_to '/login' unless current_user
  end

end
