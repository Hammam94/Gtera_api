module Types::Input
  class ShippingCategoryInputType < Types::BaseInputObject
    argument :id, ID, required: true
  end
end