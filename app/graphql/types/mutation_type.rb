module Types
  class MutationType < Types::BaseObject
    field :add_user, mutation: Mutations::AddUser
    field :add_product, mutation: Mutations::AddProduct
    field :sign_in, mutation: Mutations::SignIn
    field :approve_product, mutation: Mutations::ApproveProduct
    field :reject_product, mutation: Mutations::RejectProduct
    field :delete_product, mutation: Mutations::DeleteProduct
  end
end
