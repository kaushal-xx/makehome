json.extract! project, :id, :created_at, :updated_at, :builder_id, :status, :reason, :accommd, :contact_person_mob, :builder_name, :city, :contact_person, :country, :image_url_1, :image_url_2, :image_url_3, :image_url_4, :pincode, :project_address, :project_duration, :project_name, :project_type, :state
json.url project_url(project, format: :json)
