class CreateEnquiries < ActiveRecord::Migration[6.0]
  def change
    create_table :enquiries do |t|
      t.string :name
      t.string :mobile
      t.string :email
      t.text :message

      t.timestamps
    end
  end
end
