class NotNullColumns < ActiveRecord::Migration[5.2]
  def change
    change_column :statuses, :name, :string, null: false
    change_column :tasks, :id_event, :bigint, null: false
    change_column :tasks, :title, :string, null: false
  end
end
