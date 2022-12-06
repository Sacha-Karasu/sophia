class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token, only: :location

  def location
    current_user.update!(latitude: params["latitude"], longitude: params["longitude"])
  end
end
