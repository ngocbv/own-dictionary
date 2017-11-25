class CreateAntonyms < ActiveRecord::Migration[5.1]
  def change
    create_table :antonyms do |t|
      t.references :word, foreign_key: true
      t.references :meaning, foreign_key: true
      t.text :content

      t.timestamps
    end
  end
end
