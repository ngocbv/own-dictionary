class AddVnMeaningsToWords < ActiveRecord::Migration[5.1]
  def change
    add_column :words, :vn_meanings, :text, array: true, default: []
  end
end
