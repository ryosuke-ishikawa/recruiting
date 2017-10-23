class AddColumnToStudents < ActiveRecord::Migration
  def change
    add_column :students,  :lastname, :string
    add_column :students,  :firstname, :string
    add_column :students,  :lastname_kana, :string
    add_column :students,  :firstname_kana, :string
    add_column :students,  :sex, :integer
    add_column :students,  :birthday, :date
    add_column :students,  :adoption_year, :integer
    add_column :students,  :status, :integer
    add_column :students,  :form_photo, :string
    add_column :students,  :birthplace, :string
    add_column :students,  :phone, :string
    add_column :students,  :mobilephone, :string
  end
end
