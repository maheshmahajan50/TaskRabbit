class RemoveContactNoFromUsers < ActiveRecord::Migration[6.0]
  def change

    remove_column :users, :contact_no, :integer
  end
end
