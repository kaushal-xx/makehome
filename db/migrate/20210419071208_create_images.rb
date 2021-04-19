class CreateImages < ActiveRecord::Migration[6.0]
  def change
    create_table :images do |t|
      t.string :name
      t.string :image_type
      t.string :image_url
      t.boolean :visibility
      t.integer :slider_id

      t.timestamps
    end
  end
end
