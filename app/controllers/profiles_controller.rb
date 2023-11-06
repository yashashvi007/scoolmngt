class ProfilesController < ApplicationController
  # before_action :authenticate_admin! , only: [:new , :create]

  def index
    if admin_signed_in?
      @q = Profile.ransack(params[:q])
      @profiles = @q.result(distinct: true).page(params[:page]).per(5)
    else  
      redirect_to root_path
    end
  end

  # def show
  #   @profile = Profile.find(params[:id]) 
  # end

  def new
    # if session[:profile_id] 
    #   @profile = Profile.find(session[:profile_id])
    #   if @profile && @profile.role == "student"
    #     redirect_to profile_path(@profile)
    #   end 
    # end 
    if admin_signed_in?
      @profile = Profile.new   
    else 
      redirect_to login_path
    end 
  end

  def show
    if session[:profile_id] 
      @profile = Profile.find_by(id: session[:profile_id])
      @courses = @profile.courses
    end
  end

  def create
    @profile = Profile.new(profile_params)
    if @profile.save
      ProfileLoginMailer.with(profile: @profile).profile_login_link.deliver_now
      redirect_to root_path
    else  
      render :new ,status: :unprocessable_entity
    end
  end

  def edit
    if admin_signed_in?  
      @profile = Profile.find(params[:id])
    else  
      redirect_to root_path
    end 
  end

  def update
    if admin_signed_in?
      @profile = Profile.find(params[:id])
      if @profile.update(profile_params) 
        redirect_to profiles_path
      else  
        render :edit ,status: :unprocessable_entity
      end
    else  
      redirect_to root_path
    end
  end

  def destroy
    @profile = Profile.find(params[:id])
    @profile.destroy
    redirect_to profiles_path
  end

  private
  def profile_params 
    params.require(:profile).permit(:name, :email, :password, :role)
  end
end
