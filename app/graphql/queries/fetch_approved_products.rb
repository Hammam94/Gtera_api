module Queries
  class FetchApprovedProducts < Queries::BaseNormalUserQuery

    type [Types::ProductType], null: false

    def resolve
      Spree::Product.approved
    end
  end
end