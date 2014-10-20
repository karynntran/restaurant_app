class CreatePartiesTable < ActiveRecord::Migration
  def change
  	create_table :parties do |t|
      t.string :party_name
      t.integer :guest_num
      t.boolean :paid
      t.timestamps
    end
  end
end
