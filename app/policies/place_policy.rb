class PlacePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def create?
    return true
  end

  def destroy?
    record.user == user
  end

  def create?
    record.user == user
  end
end
