class SessionsController < ApplicationController


	def destroy
		session[:user_id] = nil
		redirect_to "/", :notice => "Logged Out"
	end

	private

	def user_params
		params.require(:user).permit(:first_name, :last_name, :profile_photo)
	end


end
