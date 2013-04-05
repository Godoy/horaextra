class Mailer < ActionMailer::Base
	default :from =>"luiz.alves@planb.com.br"
  def registration_confirm(user)
  	mail(:to => user.email, :subject =>"Registered")
  	
  end
end
