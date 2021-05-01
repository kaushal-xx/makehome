json.extract! profile, :id, :name, :created_at, :updated_at, :service_id, :status, :reason, :aadhar_back_url, :aadhar_front_url, :aadhar_no, :builder_state, :city, :country, :email_id, :mobile_no, :occupation, :other_user_name, :permanent_address, :pincode, :profile_pic, :user_type, :skill_service_provider, :approved, :current_address
json.url profile_url(profile, format: :json)
