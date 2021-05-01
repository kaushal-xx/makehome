json.extract! service, :id, :email, :name, :architect, :carpenter, :electric_fitter, :fabricator, :interior_designer, :labour, :marble_finisher, :pop_designer, :painter, :plot, :plumber, :rajmishtri, :tile_fitter, :firebase_token, :status, :reason, :created_at, :updated_at, :authentication_token, :role, :phone_number, :approved, :service_types, :work_description, :profile
if service.slider.present?
	json.slider do 
		json.partial! "sliders/slider", slider: service.slider
	end
end
json.url project_url(service, format: :json)