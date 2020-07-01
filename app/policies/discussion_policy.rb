# frozen_string_literal: true

class DiscussionPolicy < UserActionPolicy

    def new?
      administrator? || moderator? || author?
    end
  
    def create?
      administrator? || moderator? || author?
    end
  
    def edit?
      administrator? || moderator? || author?
    end
  
    def update?
      administrator? || moderator? || author?
    end
  
    def destroy?
      administrator? || moderator?
    end
  
  end