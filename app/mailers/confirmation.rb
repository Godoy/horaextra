class Confirmation < ActionMailer::Base
  default :from =>"thiago.magalhaes@planb.com.br"
  

  def registration_confirm(user)
  	@user = user
  	mail :to => "rodrigo.dias@planb.com.br"
  	
  end
end
