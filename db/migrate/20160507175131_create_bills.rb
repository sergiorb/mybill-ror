class CreateBills < ActiveRecord::Migration
  def change
    create_table :bills do |t|
      t.string :name
      t.datetime :buy_date
      t.references :shop, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
