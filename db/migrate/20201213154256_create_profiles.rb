class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.references :service
      t.string :status
      t.text :reason
      t.string :aadhar_back_url
      t.string :aadhar_front_url
      t.string :aadhar_no
      t.string :builder_state
      t.string :city
      t.string :country
      t.string :email_id
      t.string :mobile_no
      t.string :occupation
      t.string :other_user_name
      t.string :permanent_address
      t.string :pincode
      t.string :profile_pic
      t.string :user_type
      t.string :skill_service_provider

      t.timestamps
    end
  end
end
