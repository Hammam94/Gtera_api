module Types::Input
  class UserInputType < Types::BaseInputObject
    argument :email, String, required: true
    argument :password, String, required: true
    argument :role, Types::Input::RoleInputType, required: true
  end
end