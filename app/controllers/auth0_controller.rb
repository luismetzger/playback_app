class Auth0Controller < ApplicationController
 
 def callback
    # This stores all the user information that came from Auth0
    # and the IdP
    facebook_id = request.env['omniauth.auth']['uid'].split('|')[1]
    ap facebook_id
    first_name = request.env['omniauth.auth']['info']['first_name']
    ap first_name
    last_name = request.env['omniauth.auth']['info']['last_name']
    ap last_name
    profile_photo = request.env['omniauth.auth']['info']['image']
    ap profile_photo
    # Redirect to the URL you want after successfull auth

      
      if User.exists?(:facebook_id => facebook_id)
        @user = User.find_by(:facebook_id => facebook_id)
        session[:user_id] = @user.id
        redirect_to "/users/#{@user.id}"
      else 
        @user = User.create(:first_name => first_name, :last_name => last_name, :facebook_id => facebook_id, :profile_photo => profile_photo)
        session[:user_id] = @user.id
        redirect_to "/users/#{@user.id}"
      end
  end

  def failure
    # show a failure page or redirect to an error page
    @error_msg = request.params['message']
  end
end
