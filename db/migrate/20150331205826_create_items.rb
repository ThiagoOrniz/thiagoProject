class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.references :product, index: true, foreign_key: true
      t.decimal :price
      t.integer :quantity
      
      t.timestamps null: false
    end
  end
end
