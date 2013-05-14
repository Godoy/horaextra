class User < ActiveRecord::Base
	devise :omniauthable, :omniauth_providers => [:google_oauth2]

	attr_accessible :email, :name, :birthday, :picture, :gender

	has_many :overtimes, :inverse_of => :user
	has_and_belongs_to_many :projects #atende varios projetos
	has_many :discount
	
	def getPicture() 
		user = User.find_by_email(self.email)

		if(!user.picture.nil?)
			user.picture
		else
			'http://www.gravatar.com/avatar.php?gravatar_id='+Digest::MD5.hexdigest(self.email).to_s
		end

	end



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