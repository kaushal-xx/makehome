class AddComingSoonColumnToServiceType < ActiveRecord::Migration[6.0]
  def change
  	add_column :service_types, :coming_soon, :boolean, default: false
  	add_column :users, :name, :string
  	add_column :users, :profile_image, :text
  end
end
