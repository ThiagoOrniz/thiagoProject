class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.references :client, index: true, foreign_key: true
      t.references :rep, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
