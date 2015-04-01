class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.string :date
      t.references :client, index: true, foreign_key: true
      t.references :rep, index: true, foreign_key: true
 	  t.references :item, index: true, foreign_key: true
     
      t.timestamps null: false
    end
  end
end
