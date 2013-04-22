class Confirmation < ActionMailer::Base
  default :from =>"luiz.alves@planb.com.br"
  

  def registration_confirm(user)
  	@user = user
  	mail(:to => "user.email", :subject =>'thanks')
  	
  end
end
