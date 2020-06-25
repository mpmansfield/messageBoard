# Preview all emails at http://localhost:3000/rails/mailers/confirm_mailer
class ConfirmMailerPreview < ActionMailer::Preview
    def confirmation_instructions
        ConfirmMailer.confirmation_instructions(User.first, "faketoken", {})
      end
    
      def reset_password_instructions
        ConfirmMailer.reset_password_instructions(User.first, "faketoken", {})
      end
    
      def unlock_instructions
        ConfirmMailer.unlock_instructions(User.first, "faketoken", {})
      end
end
