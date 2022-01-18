module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :email, String, null: false
    field :roles, [Types::RoleType], null: false, resolver_method: :user_spree_roles
  end
end
