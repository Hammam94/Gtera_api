module Mutations
  class BaseNormalUserMutation < BaseMutation
    def authorized?
      raise GraphQL::ExecutionError, 'login required!!' unless context[:current_user]

      super
    end
  end
end