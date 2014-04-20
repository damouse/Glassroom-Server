class MobileApiController < ApplicationController
  	skip_before_filter :verify_authenticity_token #this may be dangerous, check
  	before_filter :authenticate_user_from_token!

	#check logins here
	def auth
		if user_signed_in?
			render :json => {response:'accepted auth token', status:'success'}
		else
			render :json => {response:'auth token not accepted', status:'fail'}
		end
	end

	#endpoint for logging in from a mobile app
	#CURRENTLY INSECURE
	def mobile_login
		email = params[:user_email]
		pass = params[:password]

		if not email.present? or not pass.present?
			render :json => {response:'missing parameters', status:'fail'}
		else
			user = User.find_by_email(email)

			if not user
				render :json => {response:'user not found', status:'fail'}
			else
				user.ensure_authentication_token
				render :json => {response:'user logged in',status:'success', user:user}
			end
		end
	end

	def authenticate_user_from_token!
	    user_email = params[:user_email].presence
	    user       = user_email && User.find_by_email(user_email)
	 
	    # Notice how we use Devise.secure_compare to compare the token
	    # in the database with the token given in the params, mitigating
	    # timing attacks.
	    if user && Devise.secure_compare(user.authentication_token, params[:user_token])
	      sign_in user, store: false
	    end
	end
end

