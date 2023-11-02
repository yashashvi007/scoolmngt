class Course < ApplicationRecord
  has_many :enrollments
  has_many :profiles, :through => :enrollments
end
