# frozen_string_literal: true

class ModerationPolicy < ApplicationPolicy
    def new?
      create?
    end
  
    def create?
      destroy?
    end
  
    def edit?
      update?
    end
  
    def update?
      destroy?
    end
  
    def destroy?
      allowed_to_destroy?
    end
  
    private
  
    def allowed_to_create?
      return true if administrator?
      return true if in_discipline?
  
      false
    end
  
    def allowed_to_manage?
      return true if administrator?
      return true if discipline_moderator?
      return true if owner?
  
      false
    end
  
    def allowed_to_destroy?
      return true if administrator?
  
      false
    end
  
    def discipline_author?
      author? && in_discipline?
    end
  
    def discipline_moderator?
      moderator? && in_discipline?
    end
  
    def disciplines
      record.disciplines
    end
  
    def in_discipline?
      return false if user.nil?
  
      (disciplines & user.disciplines).present?
    end
  end
  