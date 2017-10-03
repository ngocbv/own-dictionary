class CreatePronunciations < ActiveRecord::Migration[5.1]
  def change
    create_table :pronunciations do |t|
      t.references :word, foreign_key: true
      t.string :audio_link
      t.string :dialects
      t.string :phonetic_notation
      t.string :phonetic_spelling

      t.timestamps
    end
  end
end
