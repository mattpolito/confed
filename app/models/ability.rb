class Ability
  # Mixins
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user 

    if user.has_role?(:admin)
      can :manage, :all
    else
      can :create, User
      can :read, :all
    end
  end
end
