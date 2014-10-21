class AddFullNamesToAdminUser < ActiveRecord::Migration
  def change
    add_column :admin_users, :first_name, :string
    add_column :admin_users, :last_name, :string
    add_index :admin_users, [:first_name, :last_name], :unique => true, :name => 'admin_user_first_last_name_idx'
  end
end
