class Notification < ActionMailer::Base
  #default :from =>"luiz.alves@planb.com.br"
      

  def registration_confirm(overtime)
   		@overtime = overtime
   		mail(:from =>overtime.user.email, #from CORRETO
   			 :to => overtime.project.users.first.email,
   			 #:bcc => overtime.project.users.second.email,
         :cc => overtime.project.users.last.email,
   			 :subject => "[Cadastramento de Hora Extra] #{overtime.start_overtime}, #{overtime.end_overtime}, #{overtime.description}")
  
  end
  

  def send_for_rh(overtime)
  		@overtime = overtime
  		mail(:from => overtime.project.users.first.email,
  		 :to => "adriado.godoy@planb.com.br",
  		 #:bcc => "viviane.souza@planb.com.br",
  		 :subject => "[Hora Extra]")  
  end


  def your_overtime_approved(overtime)
  	@overtime = overtime
  	mail(:from => "jacqueline.pereira@planb.com.br",
  		 :to => overtime.user.email,
  		 :subject => "Confirmacao da sua Hora Extra")  	
  end
end
