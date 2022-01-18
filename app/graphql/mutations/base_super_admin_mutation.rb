module Mutations
  class BaseSuperAdminMutation < BaseMutation
    def authorized?(args)
      raise GraphQL::ExecutionError, 'login required!!' unless context[:current_user]
      raise GraphQL::ExecutionError, 'permission denied!!' unless context[:current_user].spree_roles.where(id: 2).any?
      
      true
    end
  end
end