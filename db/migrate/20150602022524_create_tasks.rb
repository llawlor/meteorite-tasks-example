class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :text

      t.timestamps null: false
    end
  end
end
