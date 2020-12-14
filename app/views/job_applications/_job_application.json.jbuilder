json.extract! job_application, :id, :job_id, :service_id, :status, :reason:created_at, :updated_at
json.url job_application_url(job_application, format: :json)
