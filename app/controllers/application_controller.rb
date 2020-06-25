class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
  
    include Pundit

    rescue_from Pundit::NotAuthorizedError, with: :forbidden_request

    protected

    def forbidden_request
      raise Pundit::NotAuthorizedError, "Not allowed to perform this action."
    end
  
    def configure_permitted_parameters
      added_attrs = [:edu_email, :desired_role, :desired_disciplines]
      devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    end
  end
