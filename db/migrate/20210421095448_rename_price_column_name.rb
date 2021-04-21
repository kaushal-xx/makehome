class RenamePriceColumnName < ActiveRecord::Migration[6.0]
  def change
  	rename_column :service_types, :pride, :price
  end
end
