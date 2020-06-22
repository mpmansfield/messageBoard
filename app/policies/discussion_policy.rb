# frozen_string_literal: true

class DiscussionPolicy < UserActionPolicy

    def new?
      administrator? || moderator?
    end
  
    def create?
      administrator? || moderator?
    end
  
    def edit?
      administrator? || moderator?
    end
  
    def update?
      administrator? || moderator?
    end
  
    def destroy?
      administrator? || moderator?
    end
  
  end