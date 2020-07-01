# frozen_string_literal: true

class UserPolicy < UserActionPolicy
  
    def edit?
      administrator?
    end
  
    def update?
      true
    end
  
    def destroy?
      administrator?
    end
  
  end