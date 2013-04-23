ActionMailer::Base.smtp_settings = {
  :address                 => "mail.planb.com.br",
  :port                    => 587,
  :domain                  => "planb.com.br",
  :user_name               => "Luiz Henrique",
  :password                => "quaresma7",
  :authentication          => :login,
  :enable_starttls_auto    => true
}


