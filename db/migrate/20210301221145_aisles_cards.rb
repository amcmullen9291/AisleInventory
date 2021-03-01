class AislesCards < ActiveRecord::Migration[6.1]
  def change
    create_join_table :aisles, :cards do |t|
      # t.index [:aisle_id, :manufacturere_id]
      # t.index [:manufacturere_id, :aisle_id]
      # t.index [:card_id, :aisle_id]
      # t.index [:aisle_id, :card_id]
    end
  end
end
