class SessionsController < ApplicationController
	def new
	end
	def create
		user = User.find_by(email: params[:session][:email])

		if user && user[:password] == params[:session][:password]
			flash[:notice] = "Session Initied"
			#log_in user 
			session[:user_id] = user.id
			redirect_to tickets_url
		else
			flash[:error] = "There was a problem authenting!"
			render action: 'new'
		end
	end

	def destroy
		log_out
		flash[:notice] = "see you soon!:)"
		redirect_to log_in_url
	end
end
