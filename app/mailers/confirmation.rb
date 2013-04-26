class Confirmation < ActionMailer::Base
  #default :from =>"luiz.alves@planb.com.br"
      

  def registration_confirm(overtime)
  	@overtime = overtime  	 
  	mail(:from =>overtime.user.email,
  		:to => overtime.project.users.first.email,
  		:bcc => overtime.project.users.second.email, overtime.project.users.three.email,
  		:subject => "[Cadastramento de Hora Extra] #{overtime.start_overtime}, #{overtime.end_overtime}, #{overtime.description}")
  	
  end
end
#mail(:to => recipient.email_address_with_name,
         #:bcc => ["bcc@example.com", "Order Watcher <watcher@example.com>"])