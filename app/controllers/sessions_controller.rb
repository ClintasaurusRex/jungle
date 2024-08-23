class SessionsController < ApplicationController
  def new
  end

  def create
    # Debugging line
    logger.debug "Params: #{params.inspect}"

    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: 'Successfully logged in!'
    else
      flash.now[:alert] = 'Invalid email or password'
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path, notice: 'Successfully logged out!'
  end
end