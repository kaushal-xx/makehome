json.extract! job, :id, :created_at, :updated_at, :project_id, :title, :description, :need_person, :status, :reason
json.url job_url(job, format: :json)
