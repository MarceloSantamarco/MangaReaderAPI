class SessionsController < ApplicationController
  
  def create
    
    begin
      @user = User.find_by(email: session_params[:email])
    rescue
      render json: {error: "Email doesn't exist"}, status: 404
      return nil
    end

    if BCrypt::Password.new(@user.try(:encrypted_password)) == session_params[:password]
      payload = {
        email: @user.email
      }
      token = encode_token(payload)
      render json: {success: 'User signed in successfully!', user: {id: @user.id, email: @user.email, name: @user.name, token: token}}, status: :ok
    else
      render json: {error: "Invalid password"}, status: 401
    end
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end

  def encode_token(payload)
    JWT.encode(payload, Rails.application.secrets.secret_key_base)
  end
end
