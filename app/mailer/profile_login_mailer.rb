class ProfileLoginMailer < ApplicationMailer
  default from: 'yashashvimaurya@gmail.com'

  def profile_login_link
    @profile = params[:profile]
    @url = 'localhost:3000/login'
    mail(to: @profile.email, subject: "Login Link")
  end
end
