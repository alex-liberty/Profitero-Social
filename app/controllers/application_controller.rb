class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  helper_method :categories_list


  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def categories_list
    @categories_list = Category.all
  end
end
