class BookPolicy < ApplicationPolicy
  attr_reader :user, :book

  def initialize(user, book)
    @user = user
    @book = book
  end

  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
    attr_reader :user, :book
  end

  def create?
    raise Pundit::NotAuthorizedError, 'must be admin' unless user.admin?

    @user.admin?
  end

  def destroy?
    raise Pundit::NotAuthorizedError, 'must be admin' unless user.admin?

    @user.admin?
  end

  def update?
    raise Pundit::NotAuthorizedError, 'must be admin' unless user.admin?

    @user.admin?
  end
end
