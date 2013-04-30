class Notification < ActionMailer::Base
  #default :from =>"luiz.alves@planb.com.br"
      

  def registration_confirm(overtime)
   		@overtime = overtime
   		mail(:from =>overtime.user.email, #from CORRETO
   			 :to => overtime.project.users.first.email,
   			 #:bcc => overtime.project.users.second.email,
   			 :subject => "[Cadastramento de Hora Extra] #{overtime.start_overtime}, #{overtime.end_overtime}, #{overtime.description}")
  
  end
  

  def send_for_rh(overtime)
  		@overtime = overtime
  		mail(:from => "lhlalves4@gmail.com",
  		 :to => "luiz.alves@planb.com.br",
  		 #:bcc => "viviane.souza@planb.com.br",
  		 :subject => "[Hora Extra]")  
  end


  def your_overtime_approved(overtime)
  	@overtime = overtime
  	mail(:from => "lhlalves4@gmail.com",
  		 :to => overtime.user.email,
  		 :subject => "Confirmacao da sua Hora Extra")  	
  end
end
#mail(:to => recipient.email_address_with_name,
         #:bcc => ["bcc@example.com", "Order Watcher <watcher@example.com>"])
#trocar confirmation por notification, model, view,