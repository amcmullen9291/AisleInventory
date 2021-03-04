class RemoveNotesFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :notes, :string
  end
end
