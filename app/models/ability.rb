class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Post, public: true
    can :read, Comment, public: true

    # additional permissions for logged in users (they can read their own posts)
    return unless user.present?

    can(:read, Post, user:)
    can :destroy, Post.where(author_id: user.id)

    can(:read, Comment, user:)
    can :destroy, Comment.where(author_id: user.id)

    return unless user.role == 'admin' # additional permissions for administrators

    can :destroy, Post
    can :destroy, Comment
  end
end
