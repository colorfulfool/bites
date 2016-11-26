class Ability
  include CanCan::Ability

  def initialize(user)
    if user.present?
      can :read, Laboratory do |laboratory|
        user.in? laboratory.users
      end
      can :manage, Experiment do |experiment|
        experiment.new_record? or user.in? experiment.laboratory.users
      end

      can :manage, Laboratory do |laboratory|
        user == laboratory.owner
      end
    end
  end
end