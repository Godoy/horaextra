class User < ActiveRecord::Base
	devise :omniauthable, :omniauth_providers => [:google_oauth2]

  attr_accessible :email, :name, :birthday, :picture, :gender


	def self.find_for_google_oauth2(access_token, signed_in_resource=nil)
	    data = access_token.info
	    extra = access_token.extra.raw_info

	    user = User.where(:email => data["email"]).first

	    unless user
	        user = User.create(name: data["name"],
		    		   	email: data["email"],
		    		   	birthday: extra["birthday"],
						picture: extra["picture"],
						gender: extra["gender"]
		    		  )
	    end
	    user
	end
end
