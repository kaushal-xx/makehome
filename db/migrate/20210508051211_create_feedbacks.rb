class CreateFeedbacks < ActiveRecord::Migration[6.0]
  def change
    create_table :feedbacks do |t|
      t.text :message
      t.integer :rating
      t.integer :service_id

      t.timestamps
    end
  end
end
