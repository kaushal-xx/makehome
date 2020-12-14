class AddPhoneNumberToUser < ActiveRecord::Migration[6.0]
  def change
  	add_column :users, :phone_number, :string, limit: 30
  	add_column :services, :phone_number, :string, limit: 30
  	add_column :builders, :phone_number, :string, limit: 30
  end
end
