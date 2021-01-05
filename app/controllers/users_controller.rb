require 'securerandom'
class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:create]

  def create
    @user = User.find_by_firebase_token user_params[:firebase_token]
    if @user.present?
      render :show
    else
      @user = User.new(user_params)
      if @user.save
        render :show
      else
        render json: { errors: @user.errors }, status: :unprocessable_entity
      end
    end
  end

  def index
    page = params[:page]||1
    if current_user.role == 'admin'
      if params[:role].present?
        @users = User.where(role: params[:role]).page(page).per(15)
      else
        @users = User.all.page(page).per(15)
      end
    end
  end

  def show
    @user = current_user
  end

  def update
    @user = current_user
   if @user.update(user_params)
     render :show
   else
     render json: { errors: @user.errors }, status: :unprocessable_entity
   end
  end

  private

  def user_params
    params.require(:user).permit(:email, :phone_number, :firebase_token)
  end

end