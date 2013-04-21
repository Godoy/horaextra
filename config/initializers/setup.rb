ActionMailer::Base.smtp_settings = {
   :tls => true,
   :address => "smtp.gmail.com",
   :port => "587",
   :domain => "www.planb.com.br",
   :authentication => :plain,
   :user_name => "<User>",
   :password => "<password>" 
}
