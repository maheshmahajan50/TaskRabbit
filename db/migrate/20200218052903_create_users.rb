class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :name
      t.string :role
      t.text :address
      t.integer :contact_no

      t.timestamps
    end
  end
end
