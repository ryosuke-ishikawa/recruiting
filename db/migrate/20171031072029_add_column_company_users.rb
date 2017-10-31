class AddColumnCompanyUsers < ActiveRecord::Migration
  def change
    add_reference :company_users,  :company,　index: true
    add_column :company_users,  :firstname, :string
    add_column :company_users,  :lastname, :string
    add_column :company_users,  :firstname_kana, :string
    add_column :company_users,  :lastname_kana, :string
    add_column :company_users,  :owner, :integer
  end
end
