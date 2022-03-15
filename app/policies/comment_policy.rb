class CommentPolicy < ApplicationPolicy
  def create?
    @user
  end 

  def destroy?
    @user
  end
end
