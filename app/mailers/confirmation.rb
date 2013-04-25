class Confirmation < ActionMailer::Base
  default :from =>"luiz.alves@planb.com.br"
  default :to => "lhlalves4@gmail.com"   

  def registration_confirm(user)
  	@user = user
  	mail(:subject => "[Cadastramento de Hora Extra] #{user.start_overtime}, #{user.end_overtime}
  	#{user.description}")
  	
  end
end
