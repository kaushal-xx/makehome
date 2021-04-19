class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  respond_to :json, :html

  before_action :authenticate_user
  # before_action :configure_permitted_parameters, if: :devise_controller?

  def authenticate_user!(options = {})
    head :unauthorized unless signed_user_in?
  end

  def authenticate_service!(options = {})
    head :unauthorized unless signed_service_in?
  end

  def authenticate_builder!(options = {})
    head :unauthorized unless signed_builder_in?
  end

  def current_user
    @current_user ||= super || User.find(@current_user_id)
  end

  def current_service
    @current_service ||= super || Service.find(@current_service_id)
  end

  def current_builder
    @current_builder ||= super || Builder.find(@current_builder_id)
  end

  def signed_user_in?
    @current_user_id.present?
  end

  def signed_service_in?
    @current_service_id.present?
  end

  def signed_builder_in?
    @current_builder_id.present?
  end

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :name])
    end

  private

  # def authenticate_user
  #   if request.headers['Authorization'].present?
  #     authenticate_or_request_with_http_token do |token|
  #       begin
  #         jwt_payload = JWT.decode(token, Rails.application.secrets.secret_key_base).first

  #         @current_user_id = jwt_payload['id']
  #       rescue JWT::ExpiredSignature, JWT::VerificationError, JWT::DecodeError
  #         head :unauthorized
  #       end
  #     end
  #   end
  # end
    


    def authenticate_user
      if request.headers['HTTP_AUTHORIZATION_USER'].present?
        @current_user_id = User.find_by_authentication_token(request.headers['HTTP_AUTHORIZATION_USER']).try(:id)
      elsif request.headers['HTTP_AUTHORIZATION_SERVICE'].present?
      	@current_service_id = Service.find_by_authentication_token(request.headers['HTTP_AUTHORIZATION_SERVICE']).try(:id)
      elsif request.headers['HTTP_AUTHORIZATION_BUILDER'].present?
      	@current_builder_id = Builder.find_by_authentication_token(request.headers['HTTP_AUTHORIZATION_BUILDER']).try(:id)
      end
    end
end
