class AddColumnCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :name, :string
    add_column :companies, :logo, :string
  end
end
