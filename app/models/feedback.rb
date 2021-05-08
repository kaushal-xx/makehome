class Feedback < ApplicationRecord

	belongs_to :service, optional: true
	belongs_to :user, optional: true

	def self.search(params = {})
	    page = params[:page]||1
	    search_params = []
	    search_params << "DATE(feedbacks.created_at) >= #{params[:min_date]}" if params[:min_date].present?
	    search_params << "DATE(feedbacks.created_at) <= #{params[:max_date]}" if params[:max_date].present?
	    search_params << "service_id = #{params[:service_id]}" if params[:service_id].present?
	    search_params << "user_id = #{params[:user_id]}" if params[:user_id].present?
	    search_params << "rating = #{params[:rating]}" if params[:rating].present?
	    search_params = search_params.join(' and ')
	    Feedback.where(search_params).page(page).per(15)
	end
end
