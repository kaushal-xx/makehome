class AddAuthenticationTokenToBuilder < ActiveRecord::Migration[6.0]
  def change
    add_column :builders, :authentication_token, :string, limit: 30
    add_index :builders, :authentication_token, unique: true
  end
end
