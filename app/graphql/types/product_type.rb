module Types
  class ProductType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :sku, String, null: false
    field :description, String, null: true
    field :slug, String, null: false
    field :approved, Boolean, null: true
    field :rejected, Boolean, null: true
  end
end
