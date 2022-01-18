module Queries
  class FetchCurrentUser < Queries::BaseNormalUserQuery

    type Types::UserType, null: false
    # type [Types::RoleType], null: false

    def resolve
      user = context[:current_user]
      # roles = user.spree_roles
      # binding.pry
      # {
      #   user: user, 
      #   # roles: roles
      # }
      user
    end
  end
end