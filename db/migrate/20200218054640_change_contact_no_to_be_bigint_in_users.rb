class ChangeContactNoToBeBigintInUsers < ActiveRecord::Migration[6.0]
  def change
  	change_column :users, :contact_no, :bigint
  end
end
