class AddColumnApprovedToUser < ActiveRecord::Migration[6.0]
  def change
  	add_column :users, :approved, :boolean, default: false
  	add_column :services, :approved, :boolean, default: false
  	add_column :builders, :approved, :boolean, default: false
  end
end
