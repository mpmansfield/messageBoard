class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  include  Devise::Controllers::Helpers

    def google_oauth2
        # You need to implement the method below in your model (e.g. app/models/user.rb)
        @user = User.from_omniauth(request.env['omniauth.auth'], "GoogleOauth2")
  
        if @user.edu_email != nil
          flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', kind: 'Google'
          sign_in_and_redirect @user, event: :authentication
        else
          session['devise.google_data'] = request.env['omniauth.auth'].except(:extra) # Removing extra as it can overflow some session stores
          sign_in @user
          redirect_to new_user_path(@user.id), alert: @user.errors.full_messages.join("\n")
        end
    end

    def azure_oauth2
      @user = User.from_omniauth(request.env['omniauth.auth'], "AzureOauth2")

      if @user.edu_email != nil
        flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', kind: 'Azure'
        sign_in_and_redirect @user, event: :authentication
      else
        session['devise.google_data'] = request.env['omniauth.auth'].except(:extra) # Removing extra as it can overflow some session stores
        sign_in @user
        redirect_to new_user_path(@user.id), alert: @user.errors.full_messages.join("\n")
      end
    end


  end
