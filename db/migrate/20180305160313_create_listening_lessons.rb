class CreateListeningLessons < ActiveRecord::Migration[5.1]
  def change
    create_table :listening_lessons do |t|
      t.string :name
      t.string :link
      t.text :script

      t.timestamps
    end
  end
end
