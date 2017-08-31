class Ability
  include CanCan::Ability

  def initialize(user) # 이 유저는 커런트유저라고 보면됨
    # Define abilities for the passed in user here. For example:
    #
      # user ||= User.new # guest user (not logged in) ||기호는 왼쪽에 있는 변수에 아무내용도없으면 오른쪽에 있는걸 넣어라
      if user.nil? # 로그인을 안했다는 뜻! 밑으로 쭈욱 권한 부여
        # 로그인 안한 경우
        can :read, :all
      elsif user.has_role? 'newbie'
        # 로그인 한 경우
        can [:read, :create], :all 
        can [:update, :destroy], Post, user_id: user.id # 자기가 쓴것만 에딧하고 지울 수 있게 하겠다.
      elsif user.has_role? 'manager'
        can [:read, :create, :update], :all
        can :destroy, Post, user_id: user.id
      elsif user.has_role? 'admin'
        can [:read, :create, :update, :destroy], :all
      end
      
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
