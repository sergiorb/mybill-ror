class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :quantity
      t.string :quantity_type
      t.decimal :price
      t.references :bill, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
