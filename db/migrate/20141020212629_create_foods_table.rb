class CreateFoodsTable < ActiveRecord::Migration
  def change
  	create_table :foods do |t|
      t.string :name
      t.integer :price
      t.string :cuisine
      t.timestamps
  	end
  end
end
