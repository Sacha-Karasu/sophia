class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  skip_before_action :verify_authenticity_token, only: :location

  def configure_permitted_parameters
    # # For additional fields in app/views/devise/registrations/new.html.erb
    # devise_parameter_sanitizer.permit(:sign_up, keys: [:latitude, :longitude])

    # For additional in app/views/devise/registrations/edit.html.erb
  end

  def location
    current_user.update!(latitude: params["latitude"], longitude: params["longitude"])
  end
end
