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
    user_image = request.env['omniauth.auth']['info']['image']
    ap user_image
    # Redirect to the URL you want after successfull auth

    #User.create ()
    redirect_to '/'
  end

  def failure
    # show a failure page or redirect to an error page
    @error_msg = request.params['message']
  end
end
