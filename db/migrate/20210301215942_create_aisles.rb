class CreateAisles < ActiveRecord::Migration[6.1]
  def change
    create_table :aisles do |t|
      t.string :aisle_number
      t.timestamps
    end
  end
end
