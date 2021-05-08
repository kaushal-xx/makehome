json.extract! feedback, :id, :message, :rating, :service_id, :created_at, :updated_at, :user_id
json.url feedback_url(feedback, format: :json)
