# frozen_string_literal: true

class Sessions::SessionsController < Devise::SessionsController
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
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
