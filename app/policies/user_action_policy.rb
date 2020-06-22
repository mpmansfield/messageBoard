# frozen_string_literal: true

class UserActionPolicy < ModerationPolicy
    def index?
      user.present?
    end
  
    def show?
      user.present?
    end
  
    def new?
      false
    end
  
    def create?
      return unless user
      return unless record.new_record?
      return unless owner?
  
      true
    end
  
    def edit?
      false
    end
  
    def update?
      false
    end
  
    def destroy?
      return unless user
      return unless record.persisted?
  
      owner?
    end
  end
  