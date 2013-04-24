class Confirmation < ActionMailer::Base
  default :from =>"luiz.alves@plan.com.br"
  

  def registration_confirm(user)
  	@user = user
  	mail :to => "diego.griep@planb.com.br"
  	
  end
end
