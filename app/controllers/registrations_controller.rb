class RegistrationsController < ApplicationController
	def new
	
	end

	def create
		@user = User.new(registration_params)

    if @user.save(registration_params)
    	flash[:notice] = "User registred successfully"
    	redirect_to root_path

    else
    	#format.html { render :new}
    	#format.json { render json: @user.errors, status: :unprocessable_entity }
    	flash[:error] = @user.errors.full_messages
    	#flash[:notice] = "Pls enter correct data"
    	redirect_to sign_in_url
    end
	end

	private
		def registration_params
			params.require(:registrations).permit(:name, :last_name, :email,:password)
    end
end
