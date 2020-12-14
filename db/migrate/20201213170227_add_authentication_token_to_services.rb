class AddAuthenticationTokenToServices < ActiveRecord::Migration[6.0]
  def change
    add_column :services, :authentication_token, :string, limit: 30
    add_index :services, :authentication_token, unique: true
  end
end
