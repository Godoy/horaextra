# -*- coding: utf-8 -*-
class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
	def google_oauth2
	    # You need to implement the method below in your model (e.g. app/models/user.rb)

	    auth = request.env["omniauth.auth"]

	    #if auth["extra"]['raw_info']['hd'] == "planb.com.br"
		    @user = User.find_for_google_oauth2(auth, current_user)
		    
		    session["auth"] = auth

		    if @user.persisted?
		      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Google"
		      #sign_in_and_redirect @user, :event => :authentication
		      sign_in @user
		      redirect_to "/registrar-hora-extra"
		    else
		      session["devise.google_data"] = auth 
		      redirect_to new_user_registration_url
		    end
		#else
		#   redirect_to root_url, notice: "Não permitido."
	    #end
	end
end