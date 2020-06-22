# frozen_string_literal: true

class BoardPolicy < UserActionPolicy

  def new?
    administrator?
  end

  def create?
    administrator?
  end

  def edit?
    administrator? || moderator?
  end

  def update?
    administrator? || moderator?
  end

  def destroy?
    administrator?
  end

end
