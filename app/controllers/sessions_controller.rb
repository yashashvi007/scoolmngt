class SessionsController < ApplicationController
  def new
    if session[:profile_id]
      redirect_to root_path
    else 
      @profile = Profile.new
    end
    
  end

  def create
      @profile = Profile.find_by(email: params[:profile][:email])
      if @profile == nil 
        @profile = Profile.new
        
      elsif @profile.present? && @profile.password == params[:profile][:password] 
        session[:profile_id] = @profile.id 
        redirect_to root_path, flash: {success: 'Logged in successfully'}
      else 
        render :new, flash: {error:  "Porfile not found"}
      end
  end

  def destroy
    session[:profile_id] = nil
    redirect_to login_path
  end

end
