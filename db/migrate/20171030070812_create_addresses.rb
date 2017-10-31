class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.references :student, index: true, foreign_key: true
      t.string :postcode 
      t.references :prefecture, index: true, foreign_key: true
      t.string :city1
      t.string :city2

      t.timestamps null: false
      
    end
  end
end
