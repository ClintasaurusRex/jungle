class UsersController < ApplicationController
  # GET /users/new
  # Initializes a new User object for the registration form
  def new
    @user = User.new
  end

  # POST /users
  # Creates a new user account and logs in the user upon successful creation
  def create
    @user = User.new(user_params)
    if @user.save
      # Set the user_id in the session to log in the user
      session[:user_id] = @user.id
      # Redirect to the home page with a welcome message
      redirect_to root_path, notice: "Welcome, #{@user.first_name}! Your account was created successfully."
    else
      # If save fails, re-render the registration form to show validation errors
      render :new
    end
  end

  private

  # Strong parameters to whitelist allowed user attributes
  # This helps prevent mass assignment vulnerabilities
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end