class Confirmation < ActionMailer::Base
  default :from =>"currency.user.email"
  default :to => "project_id.user.email"   

  def registration_confirm(user)
  	@user = user
  	mail(:subject => "[Cadastramento de Hora Extra] #{user.start_overtime}, #{user.end_overtime}
  	#{user.description}")
  	
  end
end
