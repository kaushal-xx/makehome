json.extract! call_history, :id, :caller_name, :caller_mobile, :username, :user_mobile, :date, :created_at, :updated_at
json.url call_history_url(call_history, format: :json)
