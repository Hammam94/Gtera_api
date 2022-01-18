module Queries
  class FetchRejectedProducts < Queries::BaseSuperAdminQuery

    type [Types::ProductType], null: false

    def resolve
      Spree::Product.rejected
    end
  end
end