class AddNameColumnsToServices < ActiveRecord::Migration[6.0]
  def change
  	add_column :services, :name, :string
  	add_column :profiles, :name, :string
  	add_column :builders, :name, :string
  	add_column :images, :redirect_url, :string
  	add_column :sliders, :service_type_id, :integer
  end
end
