class ApplicationController < ActionController::API

    def current_user
        token = decoded_token
        unless token.blank?
            email = token[0]['email']
            begin
                @current_user = User.find_by(email: email)
            rescue
                return nil
            end
        else
            return nil
        end
    end

    def user_signed_in?
        !!current_user
    end

    def require_login
        render json: {error: 'Not authorized'}, status: 401 unless user_signed_in?
    end

    def decoded_token
        header = request.headers['Authorization']
        if header
            token = header.split(' ')[1]
            begin
                JWT.decode(token, Rails.application.secrets.secret_key_base, true, algorithm: 'HS256')
            rescue
                return []
            end
        end
    end
end
