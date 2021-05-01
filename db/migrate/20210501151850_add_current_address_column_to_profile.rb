class AddCurrentAddressColumnToProfile < ActiveRecord::Migration[6.0]
  def change
  	add_column :profiles, :current_address, :text
  	add_column :services, :work_description, :text
  	add_column :sliders, :service_id, :integer
  end
end
