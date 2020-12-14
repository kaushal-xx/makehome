class AddRoleToUser < ActiveRecord::Migration[6.0]
  def change
  	add_column :users, :role, :string, limit: 30
  	add_column :services, :role, :string, limit: 30
  	add_column :builders, :role, :string, limit: 30
  end
end
