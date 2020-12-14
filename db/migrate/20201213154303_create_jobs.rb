class CreateJobs < ActiveRecord::Migration[6.0]
  def change
    create_table :jobs do |t|
      t.references :project
      t.string :title
      t.text :description
      t.string :need_person
      t.string :status
      t.text :reason
      t.timestamps
    end
  end
end
