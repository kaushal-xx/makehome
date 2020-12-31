class CreateServiceTypeMappings < ActiveRecord::Migration[6.0]
  def change
    create_table :service_type_mappings do |t|
      t.references :service
      t.references :service_type
      t.timestamps
    end
  end
end
