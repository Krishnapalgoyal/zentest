class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # Guest user

    if user.admin?
      can :manage, :all # Admin can manage all resources
    else
      can :read, :all   # Normal user can read all resources
    end
  end
end