class CoursesController < ApplicationController

  def index
    @courses = Course.all    
  end

  def new
    @course = Course.new
    @profiles = Profile.all
  end

  def create
    @course = Course.new(course_params)
    @course.profile_id = params[:user_id]
    if @course.save 
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end 
  end

  def show
    @course = Course.find(params[:id])    
    @profile = Profile.find_by(id: @course.profile_id)
  end

  private 
  def course_params
    params.require(:course).permit(:title, :description, :fees)
  end

  private 
  def check_student 

  end
end
