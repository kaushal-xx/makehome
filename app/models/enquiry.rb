class Enquiry < ApplicationRecord

  def self.search(params = {})
    page = params[:page]||1
    search_params = []
    search_params << "DATE(created_at) >= #{params[:min_date]}" if params[:min_date].present?
    search_params << "DATE(created_at) <= #{params[:max_date]}" if params[:max_date].present?
    search_params << "name = #{params[:name]}" if params[:name].present?
    search_params << "mobile = #{params[:mobile]}" if params[:mobile].present?
    search_params << "email = #{params[:email]}" if params[:email].present?
    search_params = search_params.join(' and ')
    Enquiry.where(search_params).distinct.page(page).per(15)
  end
end
