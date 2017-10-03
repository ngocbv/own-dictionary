class CreateMeanings < ActiveRecord::Migration[5.1]
  def change
    create_table :meanings do |t|
      t.references :word, foreign_key: true
      t.references :dictionary, foreign_key: true
      t.text :definition

      t.timestamps
    end
  end
end
