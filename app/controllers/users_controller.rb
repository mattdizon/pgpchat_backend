class UsersController < ApiController


  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  def show
    render json: @user
  end


  # POST /users
  def create
    @user = User.create!(user_params)

    if @user.save
      render json: {token: @user.auth_token}
    else
        byebug
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def profile
     @user = User.find_by_auth_token!(request.headers[:token])
      render json:{user:{username: @user.username, email: @user.email, first_name: @user.first_name, last_name: @user.last_name}}
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    #changing password to password_digest will bypass rollback but password is not encrypted
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation,
           :username, :first_name, :last_name)
    end
end
