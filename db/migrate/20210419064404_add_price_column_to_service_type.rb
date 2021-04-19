class AddPriceColumnToServiceType < ActiveRecord::Migration[6.0]
  def change
  	add_column :service_types, :pride, :float
  end
end
