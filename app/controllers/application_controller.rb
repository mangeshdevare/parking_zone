class ApplicationController < ActionController::Base
    before_action :authenticate_parking_lot!
    before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :capacity, :hourly_charge, :status, :address])
  end
end
