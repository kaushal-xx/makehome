class RemoveIndex < ActiveRecord::Migration[6.0]
  def change
  	remove_index :users, ["email"]
  	remove_index :users, ["reset_password_token"]
  	remove_index :builders, ["email"]
  	remove_index :builders, ["reset_password_token"]
  	remove_index :services, ["email"]
  	remove_index :services, ["reset_password_token"]
  end
end
