class Ability
  include CanCan::Ability
  
  def initialize(user)
    user ||= User.new #guest
    
    if user.email? #until we define roles
      can :manage, :all
    else
      can :list, Location
      can :list, Post
    end
  end
end