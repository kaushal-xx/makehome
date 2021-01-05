class AddBuilderIdColumnToProfile < ActiveRecord::Migration[6.0]
  def change
  	add_column :profiles, :builder_id, :integer
  	add_column :projects, :approved, :boolean, default: false
  end
end
