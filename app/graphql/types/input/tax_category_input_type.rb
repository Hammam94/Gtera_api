module Types::Input
  class TaxCategoryInputType < Types::BaseInputObject
    argument :id, ID, required: true
  end
end