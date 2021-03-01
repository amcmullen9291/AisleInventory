class CreateOccasions < ActiveRecord::Migration[6.1]
  def change
    create_table :occasions do |t|
      t.string :name_of
      t.timestamps
    end
  end
end
