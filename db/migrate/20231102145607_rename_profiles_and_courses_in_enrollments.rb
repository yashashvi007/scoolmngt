class RenameProfilesAndCoursesInEnrollments < ActiveRecord::Migration[7.0]
  def change
    rename_column :enrollments, :courses_id, :course_id   
    rename_column :enrollments, :profiles_id, :profile_id 
  end
end
