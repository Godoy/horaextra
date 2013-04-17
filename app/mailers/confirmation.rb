class Confirmation < ActionMailer::Base
  default :from =>"user.email"
  

  def registration_confirm(user)
  	@user = user
  	mail(:to => "user_id.email", :subject =>'user.overtime')
  	
  end
end
