class AddMainAdminToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :main_admin, :boolean, default: false
  end
end
