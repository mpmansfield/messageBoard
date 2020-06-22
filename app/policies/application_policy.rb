# frozen_string_literal: true

class ApplicationPolicy
    attr_reader :user, :record
  
    def initialize(user, record)
      @user = user
      @record = record
    end
  
    def index?
      granted?
    end
  
    def show?
      granted?
    end
  
    def new?
      allowed?
    end
  
    def create?
      allowed?
    end
  
    def edit?
      allowed?
    end
  
    def update?
      allowed?
    end
  
    def destroy?
      allowed?
    end
  
    def allowed?
      return false unless granted?
  
      user.is_a?(User) && \
        !user.role_viewer?
    end
  
    def can_moderate?
      moderator? || administrator?
    end
  
    def viewer?
      user&.role_viewer?
    end
  
    def author?
      user&.role_author?
    end
  
    def moderator?
      user&.role_moderator?
    end
  
    def administrator?
      user&.role_administrator?
    end
  
    def owner?
      return false if user.nil?
      return false unless record.respond_to?(:user_id)
  
      record.user_id == user.id
    end
  
    private
  
    def granted?
      true
    end
  
    class Scope
      attr_reader :user, :scope
  
      def initialize(user, scope)
        @user = user
        @scope = scope
      end
  
      def resolve
        scope.all
      end
    end
  end
  