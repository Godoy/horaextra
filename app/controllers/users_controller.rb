class UsersController < ApplicationController
  def sign_out
  	sign_out
  	redirect_to root_url
  end
end
