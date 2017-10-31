class CreatePrefectures < ActiveRecord::Migration
  def change
    create_table :prefectures do |t|
      t.string :name, null: false
      t.string :area, null: false

      t.timestamps null: false
    end
  end
end
