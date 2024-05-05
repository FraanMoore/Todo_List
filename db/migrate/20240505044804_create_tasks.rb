class CreateTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :tasks do |t|
      t.text :title
      t.text :description, limit: 200
      t.boolean :completed

      t.timestamps
    end
  end
end
