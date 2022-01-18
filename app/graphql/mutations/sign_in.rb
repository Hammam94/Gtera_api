module Mutations
  class SignIn < Mutations::BaseMutation
    argument :params, Types::Input::SignInInputType, required: true

    field :user, Types::UserType, null: false
    field :token, String, null: false

    def resolve(params:)
      sign_in_params = Hash params

      begin
        user = Spree.user_class.find_for_database_authentication(email: sign_in_params[:email])
        if user&.valid_for_authentication? { user.valid_password?(sign_in_params[:password]) }
          crypt = ActiveSupport::MessageEncryptor.new(Rails.application.credentials.secret_key_base.byteslice(0..31))
          token = crypt.encrypt_and_sign("user-id:#{ user.id }")
          context[:session][:token] = token
          {
            user: user,
            token: token
          }
        end
      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
          " #{e.record.errors.full_messages.join(', ')}")
      end
    end
  end
end