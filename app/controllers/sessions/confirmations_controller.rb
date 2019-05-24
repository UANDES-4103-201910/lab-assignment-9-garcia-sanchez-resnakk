# frozen_string_literal: true

class Sessions::ConfirmationsController < Devise::ConfirmationsController
  def new
    if current_user
      redirect_to current_user

    end
    
    
  end

  def create
    user = User.where(email: user_params[:email]).first
    puts user
    if user && user.password == user_params[:password]
        # Save the user ID in the session so it can be used in
        # subsequent requests
        session[:current_user_id] = user.id
        flash[:notice] = "Successful Login"
        redirect_to user
      else
        flash[:error] = "Invalid credentials"
        redirect_to root_url
      end
  end

  def destroy
    @current_user = session[:current_user_id] = nil
    session["warden.user.user.key"][0][0] = 0
      redirect_to root_url
  end

  def user_params
      params.require(:session).permit(:email, :password)
    end

    def google_logged_in
      if session["warden.user.user.key"] then true else false end
    end
  # GET /resource/confirmation/new
  # def new
  #   super
  # end

  # POST /resource/confirmation
  # def create
  #   super
  # end

  # GET /resource/confirmation?confirmation_token=abcdef
  # def show
  #   super
  # end

  # protected

  # The path used after resending confirmation instructions.
  # def after_resending_confirmation_instructions_path_for(resource_name)
  #   super(resource_name)
  # end

  # The path used after confirmation.
  # def after_confirmation_path_for(resource_name, resource)
  #   super(resource_name, resource)
  # end
end
