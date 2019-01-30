class AddAuthenticationTokenToContacts < ActiveRecord::Migration[5.1]
  def change
    add_column :contacts, :authentication_token, :string, limit: 30
    add_index :contacts, :authentication_token, unique: true
  end
end
