class AssignMailer < ApplicationMailer
    def assignment_email
        @user = params[:user]
        mail(to: @user.edu_email, subject: 'Quizzium Role Assignment')
    end
end
