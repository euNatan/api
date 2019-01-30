class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :categories do |t|
      t.string :name
      t.integer :ancestry
      t.integer :weight
      t.boolean :enable
      t.string :icon

      t.timestamps
    end
  end
end
