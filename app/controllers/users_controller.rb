class UsersController < ApplicationController
	def signup
		if !session[:id].present? then
			@user= User.new
		else
			redirect_to root_path
		end
	end

	def signup_process

		@req=params[:user]
		@user = User.new()
		@user.name=@req["name"]
		@user.email=@req["email"]
		@user.password=@req["password"]
		@user.user_type= @req["user_type"]
		if @user.save then
			redirect_to users_signin_path
		else
			flash[:error]= 'Error while processing ! please try again later.'
			redirect_to users_signup_path
		end
	end

	def signin
		if !session[:id].present? then
			@user= User.new
		else
			redirect_to root_path
		end
	end

	def signin_process
		req=params[:user]
		user=User.where(:email => req["email"]).first
		if user.present? then
			if user.password==req["password"] then
				session[:email]= user.email
				session[:name]=user.name
				session[:id]=user.id
				session[:role]=user.user_type
				redirect_to root_path
			else
				flash[:error] = 'Invalid Credentials'
				redirect_to users_signin_path
			end
		else
			flash[:error] = 'Invalid Credentials'
			redirect_to users_signin_path
		end
	end

	def logout
		reset_session
		redirect_to users_signin_path
	end

	def dashboard
		if session[:id].present? then
			@session=session
			@projects=Project.joins(:project_users).where(:project_users => {user_id: session[:id]}).distinct
		else
			redirect_to users_signin_path
		end
	end 
end