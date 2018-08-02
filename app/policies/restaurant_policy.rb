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
    user_is_owner?
  end

  def destroy?
    user_is_owner?
  end

  private

  def user_is_owner?
    record.user == user
  end
end
