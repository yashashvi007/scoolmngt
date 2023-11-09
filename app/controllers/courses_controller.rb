class CoursesController < ApplicationController
  def index
    @courses = Course.all   
    if session[:profile_id]
      @profile = Profile.find(session[:profile_id])
    end
  end

  def new
    if admin_signed_in?  
      @course = Course.new
      @profiles = Profile.where(role: "teacher")
    else  
      redirect_to login_path
    end
    
  end

  def create
    @course = Course.new(course_params)
    @course.profile_id = params[:user_id]
    if @course.save 
      redirect_to courses_path
    else
      render :new, status: :unprocessable_entity
    end 
  end

  def show
    @course = Course.find(params[:id])    
    @profile = Profile.find_by(id: @course.profile_id)
  end

  def edit
    @course = Course.find(params[:id])    
  end

  def update
    @course = Course.find(params[:id])

    if @course.update(course_params)
      redirect_to courses_path
    else 
      render :edit , status: :unprocessable_entity
    end
  end

  def delete
    @course = Course.find(params[:id])
    @course.destroy
    redirect_to courses_path
  end

  private 
  def course_params
    params.require(:course).permit(:title, :description, :fees, :course_image)
  end

  private 
  def check_student 
    
  end
end
