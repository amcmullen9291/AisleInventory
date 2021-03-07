class AddColToJoinTable < ActiveRecord::Migration[6.1]
  def change
    add_column :aisles_manufactureres, :notes, :string
  end
end
