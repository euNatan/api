class AddColumsToContacts < ActiveRecord::Migration[5.1]
  def change
    add_column :contacts, :cpf, :string
    add_column :contacts, :genre, :string
    add_column :contacts, :state, :string
    add_column :contacts, :city, :string
    add_column :contacts, :neighborhood, :string
    add_column :contacts, :lat, :float
    add_column :contacts, :long, :float
  end
end
