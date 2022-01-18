module Mutations
  class AddUser < Mutations::BaseSuperAdminMutation
    argument :params, Types::Input::UserInputType, required: true

    field :user, Types::UserType, null: false

    def resolve(params:)
      all_params = Hash params
      user_params = all_params.except(:role)
      role_params = all_params[:role]

      begin
        user = Spree::User.create!(user_params)       
        user.spree_roles << Spree::Role.find(role_params[:id].to_i)

        { user: user }
      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
          " #{e.record.errors.full_messages.join(', ')}")
      end
    end
  end
end