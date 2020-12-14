class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.references :builder
      t.string :status
      t.text :reason
      t.string :accommd
      t.string :contact_person_mob
      t.string :builder_name
      t.string :city
      t.string :contact_person
      t.string :country
      t.string :image_url_1
      t.string :image_url_2
      t.string :image_url_3
      t.string :image_url_4
      t.string :pincode
      t.string :project_address
      t.string :project_duration
      t.string :project_name
      t.string :project_type
      t.string :state

      t.timestamps
    end
  end
end
