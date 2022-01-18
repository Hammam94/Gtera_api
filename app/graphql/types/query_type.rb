module Types
  class QueryType < Types::BaseObject
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    
    field :fetch_users, resolver: Queries::FetchUsers
    field :fetch_pending_products, resolver: Queries::FetchPendingProducts
    field :fetch_approved_products, resolver: Queries::FetchApprovedProducts
    field :fetch_rejected_products, resolver: Queries::FetchRejectedProducts
    field :fetch_current_user, resolver: Queries::FetchCurrentUser

  end
end
