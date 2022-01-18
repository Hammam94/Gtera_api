class ApplicationController < ActionController::API
  include CanCan::ControllerAdditions

  # authorize_resource
  # check_authorization

  rescue_from CanCan::AccessDenied do |exception|
    head(:forbidden)
  end
end
