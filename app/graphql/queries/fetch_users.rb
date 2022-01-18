module Queries
  class FetchUsers < Queries::BaseSuperAdminQuery

    type [Types::UserType], null: false

    def resolve
      Spree::User.all
    end
  end
end