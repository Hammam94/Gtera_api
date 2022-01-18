module Queries
  class FetchPendingProducts < Queries::BaseAdminQuery

    type [Types::ProductType], null: false

    def resolve
      Spree::Product.pending
    end
  end
end