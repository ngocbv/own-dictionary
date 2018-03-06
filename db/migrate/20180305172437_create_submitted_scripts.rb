class CreateSubmittedScripts < ActiveRecord::Migration[5.1]
  def change
    create_table :submitted_scripts do |t|
      t.references :user, foreign_key: true
      t.references :listening_lesson, foreign_key: true
      t.text :content

      t.timestamps
    end
  end
end
