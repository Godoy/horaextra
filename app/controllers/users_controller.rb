class UsersController < ApplicationController
  def sign_out
	reset_session
  	redirect_to root_url
  end
end