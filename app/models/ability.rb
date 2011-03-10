class Ability
  include CanCan::Ability
  
  def initialize(user)
    user ||= User.new #guest
    
    if user.email?
      can :manage, :all
    else
      can :list, Location
      can :list, Post
    end
  end
end