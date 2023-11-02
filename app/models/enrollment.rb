class Enrollment < ApplicationRecord
  belongs_to :course
  belongs_to :profile
end
