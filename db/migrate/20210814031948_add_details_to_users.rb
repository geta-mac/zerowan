class AddDetailsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name, :string
    add_column :users, :address, :string
    add_column :users, :phone, :string
    add_column :users, :raising_experience, :boolean
    add_column :users, :isfrozen, :boolean, default: false
  end
end
