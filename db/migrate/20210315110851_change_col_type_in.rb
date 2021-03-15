class ChangeColTypeIn < ActiveRecord::Migration[6.1]
  def change
    rename_column :interactions, :employee_id, :user_id
  end
end
