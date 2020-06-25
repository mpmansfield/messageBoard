class ConfirmMailer < ApplicationMailer

    def confirmation_email
        @user = params[:user]
        @confirmation_token = @user.confirmation_token
        @url = "localhost:3000/user/#{@user.id}/confirm/#{@confirmation_token}"
        mail(to: @user.edu_email, subject: 'Quizzium Email Confirmation')
    end

end
