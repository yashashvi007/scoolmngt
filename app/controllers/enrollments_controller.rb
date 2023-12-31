class EnrollmentsController < ApplicationController

  def index
    course = Course.find(params[:course_id])
    @profiles = course.profiles
  end

  def create
     course = Course.find_by(id: params[:course_id])
     profile = Profile.find_by(id: session[:profile_id])
     enrollment = Enrollment.create(profile_id: session[:profile_id], course_id: params[:course_id])
     redirect_to course_enrollments_path
  end
end
