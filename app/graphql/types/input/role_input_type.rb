module Types::Input
  class RoleInputType < Types::BaseInputObject
    argument :id, ID, required: true
    argument :name, String, required: false
  end
end