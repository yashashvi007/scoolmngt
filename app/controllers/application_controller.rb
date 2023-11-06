class ApplicationController < ActionController::Base 
  def current_profile
    @current_profile ||= session[:profile_id] && Profile.find_by(id: session[:profile_id])    
  end

  def teacher?
    current_profile.role == "teacher"    
  end

  def student?
    current_profile.role == "student"
  end

  def profile_signed_in? 
    !current_profile.nil?
  end

  def authenticate_profile 
    if current_profile.nil?
     redirect_to sessions_path 
    end
  end

  def redirect_if_authenticated 
    redirect_to root_path    
  end
end
