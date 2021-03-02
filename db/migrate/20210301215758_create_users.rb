class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :employeeInit
      t.string :store_id
      t.string :password
      t.string :password_confirmation
      t.string :password_digest
      t.string :notes 
      t.string :email
      t.string :telephone 
      t.string :uid 
      t.string :name 
      t.string :provider     
      t.timestamps
    end
  end
end
