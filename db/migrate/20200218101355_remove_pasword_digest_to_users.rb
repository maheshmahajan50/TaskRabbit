class RemovePaswordDigestToUsers < ActiveRecord::Migration[6.0]
  def change
  	remove_column :users, :pasword_digest, :string
  end
end
