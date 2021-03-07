class CreateJoinTableManufacturereAisle < ActiveRecord::Migration[6.1]
  def change
    create_join_table :manufactureres, :aisles do |t|
      t.index [:manufacturere_id, :aisle_id]
      t.index [:aisle_id, :manufacturere_id]
    end
  end
end
