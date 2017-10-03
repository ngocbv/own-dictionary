class CreateWords < ActiveRecord::Migration[5.1]
  def change
    create_table :words do |t|
      t.string :name
      t.boolean :updated, default: false
      t.string :language, default: 'en'

      t.timestamps
    end
  end
end
