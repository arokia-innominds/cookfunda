class Ability
  include CanCan::Ability

  def initialize(user)
    if user.try(:admin?)
      can :read, :dashboard
      can :manage, :admin # listed separately for clarity
      can :manage, :all
      cannot :destroy, User
    end
  end
end
