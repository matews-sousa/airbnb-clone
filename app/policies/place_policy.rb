class PlacePolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def new?
    user.is_host?
  end

  def create?
    new?
  end

  def edit?
    new?
  end

  def update?
    new? && record.host == user
  end

  def destroy?
    update?
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
