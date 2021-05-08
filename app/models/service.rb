class Service < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :validatable
  acts_as_token_authenticatable

	has_many :service_type_mappings
	has_many :service_types, through: :service_type_mappings
  has_many :feedbacks

	has_one :profile
  has_one :slider

  #=============== Nested attributes =============================
  accepts_nested_attributes_for :profile


  def self.search(params = {})
    page = params[:page]||1
    search_params = []
    search_status = {status: params[:status]} if params[:status].present?
    search_params << "DATE(services.created_at) >= #{params[:min_date]}" if params[:min_date].present?
    search_params << "DATE(services.created_at) <= #{params[:max_date]}" if params[:max_date].present?
    search_params << "services.id = #{params[:service_id]}" if params[:service_id].present?
    search_params << "service_type_mappings.service_type_id = #{params[:service_type_id]}" if params[:service_type_id].present?
    search_params << "profiles.state = #{params[:state]}" if params[:state].present?
    search_params << "profiles.city = #{params[:city]}" if params[:city].present?
    search_params << "profiles.current_address like %#{params[:current_address]}%" if params[:current_address].present?
    search_params = search_params.join(' and ')
    if params[:service_type_id].present?
      Service.joins(:service_type_mappings).where(search_params).where(search_status).distinct.page(page).per(15)
    else
      Service.where(search_params).where(search_status).distinct.page(page).per(15)
    end
  end
end
