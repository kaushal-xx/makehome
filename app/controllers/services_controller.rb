require 'securerandom'
class ServicesController < ApplicationController
  before_action :authenticate_service!, except: [:create]

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
    page = params[:page]||1
    if current_service.role == 'admin'
      if params[:role].present?
        @services = Service.where(role: params[:role]).page(page).per(15)
      else
        @services = Service.all.page(page).per(15)
      end
    end
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
    params.require(:service).permit(:email, :phone_number, :architect, :carpenter, :electric_fitter, :fabricator, :interior_designer, :labour, :marble_finisher, :pop_designer, :painter, :plot, :plumber, :rajmishtri, :tile_fitter, :firebase_token, :status, :reason)
  end

end