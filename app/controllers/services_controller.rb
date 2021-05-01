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

  def upload_images
    if params[:images].present?
      if current_service.slider.present?
        slider = current_service.slider
        slider.images.delete_all
        params[:images].map{|url| slider.images.new(image_type: 'Service', image_url: url, visibility: true).save}
      else
        slider = Slider.new(slider_type: 'Service', visibility: true, service_id: current_service.id)
        images = params[:images].map{|url| slider.images.new(image_type: 'Service', image_url: url, visibility: true)}
        slider.save
      end
    else
      render json: { errors: "images should not be blank" }, status: :unprocessable_entity
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
    params.require(:service).permit(:name, :email, :phone_number, :architect, :carpenter, :electric_fitter, :fabricator, :interior_designer, :labour, :marble_finisher, :pop_designer, :painter, :plot, :plumber, :rajmishtri, :tile_fitter, :firebase_token, :status, :reason, :work_description, service_type_ids: [], 
      profile_attributes: [:name, :service_id, :builder_id, :status, :reason, :aadhar_back_url, :aadhar_front_url, :aadhar_no, :builder_state, :city, :country, :email_id, :mobile_no, :occupation, :other_user_name, :permanent_address, :pincode, :profile_pic, :user_type, :current_address, :skill_service_provider])
  end

end