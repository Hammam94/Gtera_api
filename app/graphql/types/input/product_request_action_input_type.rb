module Types::Input
  class ProductRequestActionInputType < Types::BaseInputObject
    argument :id, ID, required: true
  end
end
