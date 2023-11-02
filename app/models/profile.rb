class Profile < ApplicationRecord

  has_many :enrollments
  has_many :courses, :through => :enrollments

  VALID_EMAIL_REGEX = /^[A-Za-z0-9+_.-]+@(.+)$/
  validates :email, presence: true, uniqueness: { case_sensetive: false }, format: {with: VALID_EMAIL_REGEX, multiline:true}
  validates :password, presence: true, length: {minimum: 3, maximum: 30}
  validates :role , presence: true, inclusion: {in: %w(teacher student) , message: "message can be only student of teacher"}

  scope :teacher, -> { where(:role => "teacher") } 
  scope :student, -> { where(:role => "student")}

  # def self.findByEmail(email) 
  #   begin
  #     profile =  Profile.find_by(email: email)
  #     if profile == nil
  #       raise "Couldn't find profile"
  #     end
  #   rescue => exception
  #     p exception.message
  #   end
  # end

  # profile = Profile.find_by(email: email)
  # if profile
  # else
  # end

end
