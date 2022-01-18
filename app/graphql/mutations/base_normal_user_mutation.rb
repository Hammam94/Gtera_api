module Mutations
  class BaseNormalUserMutation < BaseMutation
    def authorized?(args)
      raise GraphQL::ExecutionError, 'login required!!' unless context[:current_user]

      true
    end
  end
end