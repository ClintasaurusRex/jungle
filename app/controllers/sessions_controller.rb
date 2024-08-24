class SessionsController < ApplicationController
  # GET /login
  # Renders the login form
  def new
  end

  # POST /login
  # Authenticates the user and creates a new session
  def create
    # Find the user by email (case-insensitive)
    user = User.find_by(email: params[:session][:email].downcase)

    # Check if the user exists and the password is correct
    if user && user.authenticate(params[:session][:password])
      # Set the user_id in the session to log in the user
      session[:user_id] = user.id
      redirect_to root_path, notice: 'Successfully logged in!'
    else
      # If authentication fails, show an error message
      flash.now[:alert] = 'Invalid email or password'
      render :new
    end
  end

  # DELETE /logout
  # Ends the user's session (logs out the user)
  def destroy
    session.delete(:user_id)
    redirect_to root_path, notice: 'Successfully logged out!'
  end
end