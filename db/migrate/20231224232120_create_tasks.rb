class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.bigint :id_event
      t.string :title
      t.text :description
      t.references :status, foreign_key: true

      t.timestamps
    end
  end
end
