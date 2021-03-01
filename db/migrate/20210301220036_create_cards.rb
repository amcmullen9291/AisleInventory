class CreateCards < ActiveRecord::Migration[6.1]
  def change
    create_table :cards do |t|
      t.string :description
      t.integer :in_stock
      t.string :sku
      t.string :manufacturer_id
      t.belongs_to :aisle, index: true 
      t.belongs_to :occasion, index: true 
      t.timestamps
    end
  end
end
