class Image < ApplicationRecord
	belongs_to :slider

	def self.search(params = {})
		page = params[:page]||1
		search_params = []
		search_params << "DATE(images.created_at) >= #{params[:min_date]}" if params[:min_date].present?
		search_params << "DATE(images.created_at) <= #{params[:max_date]}" if params[:max_date].present?
		search_params << "name = #{params[:name]}" if params[:name].present?
		search_params << "image_type = #{params[:image_type]}" if params[:image_type].present?
		search_params << "image_url = #{params[:image_url]}" if params[:image_url].present?
		search_params << "slider_id = #{params[:slider_id]}" if params[:slider_id].present?
		search_params << "visibility = #{params[:visibility]}" if params[:visibility].present?
		search_params = search_params.join(' and ')
		Image.where(search_params).distinct.page(page).per(15)
	end
end
