class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Post, public: true

    # additional permissions for logged in users (they can read their own posts)
    return unless user.present?

    can(:read, Post, user:)
    can :destroy, Post.where(author_id: user.id)

    return unless user.role == 'admin' # additional permissions for administrators

    can :destroy, Post
  end
end
