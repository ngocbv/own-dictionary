class CreateDictionaries < ActiveRecord::Migration[5.1]
  def change
    create_table :dictionaries do |t|
      t.string :name
      t.string :homepage
      t.string :api_homepage

      t.timestamps
    end
  end
end
