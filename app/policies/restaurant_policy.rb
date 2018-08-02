class RestaurantPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      # scope is what is passed to policy_scope
      # Restaurant.all
      scope.all
    end
  end

  def create?
    true
  end

  def update?
    # user is the current_user
    # record is the instance passed into authorize
    # record is the @restaurant
    user_is_owner_or_admin?
  end

  def destroy?
    user_is_owner_or_admin?
  end

  private

  def user_is_owner_or_admin?
    record.user == user || user.admin
  end
end
