class ProfilesController < ApplicationController
  # before_action :authenticate_admin! , only: [:new , :create]

  def index
    authenticate_user
    @profiles = Profile.all
  end

  def show
    @profile = Profile.find(params[:id])
  end

  def new
    @profile = Profile.new
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
    @profile = Profile.find(params[:id])
  end

  def update
    @profile = Profile.find(params[:id])

    if @profile.update(profile_params) 
      redirect_to root_path
    else  
      render :edit ,status: :unprocessable_entity
    end
  end

  private
  def profile_params 
    params.require(:profile).permit(:name, :email, :password, :role)
  end
end
