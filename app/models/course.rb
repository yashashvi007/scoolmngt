class Course < ApplicationRecord
  
  has_many :enrollments
  has_many :profiles, :through => :enrollments

  has_one_attached :course_image
end
