class SessionsController < ApiController
    skip_before_action :require_login, only: [:create], raise: false

  def new
  end
  def create
    if user = User.validate_login(params[:username],params[:password])
        allow_token_to_be_used_only_once_for(user)
        send_token_for_valid_login_of(user)
    else
        render_unauthorized("Error with username of password")
    end

  end
  def destroy
    logout
    head :ok
  end
  private
  def send_token_for_valid_login_of(user)
      render json:{token: user.auth_token}
  end
  def allow_token_to_be_used_only_once_for(user)
      user.regenerate_auth_token
  end
  def logout
      current_user.invalidate_token
  end
end
#original method
# def new
# end
# def create
#    user = User.find_by_email(params[:email])
#    if user && user.authenticate(params[:password])
     #session[:user_id] = user.id
    # redirect_to root_url, notice: "Logged in!"
   #else
     #flash.now[:alert] = "Email or password is invalid"
    # render "new"
   #end
 #end
# def destroy
#    session[:user_id] = nil
#    redirect_to root_url, notice: "Logged out!"
# end
