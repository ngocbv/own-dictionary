class CreateExamples < ActiveRecord::Migration[5.1]
  def change
    create_table :examples do |t|
      t.references :meaning, foreign_key: true
      t.text :content

      t.timestamps
    end
  end
end
