class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :name
      t.float :price
      t.text :description
      t.string :image
      t.boolean :enable
      t.references :user, foreign_key: true
      t.references :status, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
