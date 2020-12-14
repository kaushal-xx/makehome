require 'securerandom'
class BuildersController < ApplicationController
  before_action :authenticate_builder!, except: [:create]

  def create
    @builder = Builder.find_by_firebase_token builder_params[:firebase_token]
    if @builder.present?
      render :show
    else
      @builder = Builder.new(builder_params)
      if @builder.save
        render :show
      else
        render json: { errors: @builder.errors }, status: :unprocessable_entity
      end
    end
  end

  def index
    page = params[:page]||1
    if current_builder.role == 'admin'
      if params[:role].present?
        @builders = Builder.where(role: params[:role]).page(page).per(15)
      else
        @builders = Builder.all.page(page).per(15)
      end
    end
  end

  def show
  end

  def update
   if current_builder.update(builder_params)
     render :show
   else
     render json: { errors: current_builder.errors }, status: :unprocessable_entity
   end
  end

  private

  def builder_params
    params.require(:builder).permit(:email, :phone_number, :firebase_token, :status, :reason)
  end

end