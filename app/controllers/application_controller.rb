class ApplicationController < ActionController::Base 
  def current_user
    @current_user ||= session[:profile_id] && Profile.find_by(id: session[:profile_id])    
  end

  def user_signed_in? 
    !current_user.nil?
  end

  def authenticate_user 
    if current_user.nil?
     redirect_to sessions_path 
    end
  end

  def redirect_if_authenticated 
    redirect_to root_path    
  end
end
