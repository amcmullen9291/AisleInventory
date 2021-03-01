class CreateManufactureres < ActiveRecord::Migration[6.1]
  def change
    create_table :manufactureres do |t|
      t.string :name 
      t.timestamps
    end
  end
end
