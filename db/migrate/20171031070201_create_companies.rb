class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :postcode 
      t.references :prefecture, index: true, foreign_key: true
      t.string :city1
      t.string :city2
      t.string :phone
      t.string :home_url
      t.string :recruit_url
      t.references :business, index: true, foreign_key: true
      t.references :listing, index: true, foreign_key: true
      t.references :employee_number, index: true, foreign_key: true
      t.integer :activeyear
      t.string :business_lineup

      t.timestamps null: false
      
    end
  end
end