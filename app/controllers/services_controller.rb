require 'securerandom'
class ServicesController < ApplicationController
  before_action :authenticate_service!, except: [:create, :service_type_list, :index]

  def service_type_list
    @service_types = ServiceType.all
  end

  def create
    @service = Service.find_by_firebase_token service_params[:firebase_token]
    if @service.present?
      render :show
    else
      @service = Service.new(service_params)
      if @service.save
        render :show
      else
        render json: { errors: @service.errors }, status: :unprocessable_entity
      end
    end
  end

  def index
    @services = Service.search(params)
  end

  def show
    @service = current_service
  end

  def update
    @service = current_service
   if @service.update(service_params)
     render :show
   else
     render json: { errors: @service.errors }, status: :unprocessable_entity
   end
  end

  private

  def service_params
    params.require(:service).permit(:email, :phone_number, :architect, :carpenter, :electric_fitter, :fabricator, :interior_designer, :labour, :marble_finisher, :pop_designer, :painter, :plot, :plumber, :rajmishtri, :tile_fitter, :firebase_token, :status, :reason, service_type_ids: [], profile_attributes: [:service_id, :builder_id, :status, :reason, :aadhar_back_url, :aadhar_front_url, :aadhar_no, :builder_state, :city, :country, :email_id, :mobile_no, :occupation, :other_user_name, :permanent_address, :pincode, :profile_pic, :user_type, :skill_service_provider])
  end

end