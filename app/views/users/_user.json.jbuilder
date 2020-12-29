json.extract! user, :id, :email, :firebase_token, :created_at, :updated_at, :authentication_token, :role, :phone_number, :approved
json.url project_url(user, format: :json)