class CreateInteractions < ActiveRecord::Migration[6.1]
  def change
    create_table :interactions do |t|
      t.string :employeeInit
      t.string :content
      t.string :employee_id
      t.timestamps
    end
  end
end
