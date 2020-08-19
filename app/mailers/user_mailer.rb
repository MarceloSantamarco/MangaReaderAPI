class UserMailer < ApplicationMailer
    def forgot_password
        @user = params[:user]
        @password = params[:password]
        mail(to: @user.email, subject: 'Recuperação de senha')
    end
end
