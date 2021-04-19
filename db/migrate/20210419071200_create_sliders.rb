class CreateSliders < ActiveRecord::Migration[6.0]
  def change
    create_table :sliders do |t|
      t.string :name
      t.string :slider_type
      t.boolean :visibility

      t.timestamps
    end
  end
end
