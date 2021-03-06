module Queries
  class BaseAdminQuery < Queries::BaseQuery
    def authorized?
      raise GraphQL::ExecutionError, 'login required!!' unless context[:current_user]
      raise GraphQL::ExecutionError, 'permission denied!!' unless context[:current_user].spree_roles.where(id: [1, 2]).any?

      super
    end
  end
end