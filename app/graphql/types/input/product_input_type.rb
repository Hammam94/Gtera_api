module Types::Input
  class ProductInputType < Types::BaseInputObject
    argument :name, String, required: true
    argument :sku, String, required: false
    argument :description, String, required: false
    argument :slug, String, required: false
    argument :shipping_category, Types::Input::ShippingCategoryInputType, required: false
    argument :price, Float, required: true
  end
end
