class CreateNotes < ActiveRecord::Migration[6.1]
  def change
    create_table :notes do |t|
      t.string :content
      t.string :employeeInit
      t.timestamps
    end
  end
end
