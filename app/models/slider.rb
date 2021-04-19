class Slider < ApplicationRecord
	has_many :images
	accepts_nested_attributes_for :images, :allow_destroy => true

  def self.search(params = {})
    page = params[:page]||1
    search_params = []
    search_params << "DATE(sliders.created_at) >= #{params[:min_date]}" if params[:min_date].present?
    search_params << "DATE(sliders.created_at) <= #{params[:max_date]}" if params[:max_date].present?
    search_params << "name = #{params[:name]}" if params[:name].present?
    search_params << "slider_type = #{params[:slider_type]}" if params[:slider_type].present?
    search_params << "visibility = #{params[:visibility]}" if params[:visibility].present?
    search_params = search_params.join(' and ')
    Slider.where(search_params).distinct.page(page).per(15)
  end
end
