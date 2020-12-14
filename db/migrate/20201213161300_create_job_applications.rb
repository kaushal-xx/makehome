class CreateJobApplications < ActiveRecord::Migration[6.0]
  def change
    create_table :job_applications do |t|
      t.references :job
      t.references :service
      t.string :status
      t.text :reason
      t.timestamps
    end
  end
end
