class Confirmation < ActionMailer::Base
  default :from =>"luiz.alves@plan.com.br"
  

  def registration_confirm(user)
  	@user = user
  	mail :to => "lhlalves4@gmail.com"
  	
  end
end
