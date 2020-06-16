class BoardPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end

    def create?
      if administrator?
        return true
      else
        return false
      end
    end



  end
end
