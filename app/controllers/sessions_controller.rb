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
      render json: {success: 'User signed in successfully!', token: token}, status: :ok
    else
      render json: {error: "Invalid password"}, status: 404
    end
  end

  def destroy
    if user_signed_in?
      render json: {success: 'User signed out successfully'}, status: :ok
    else
      render json: {error: 'What the hell are you doing??'}, status: 404
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
