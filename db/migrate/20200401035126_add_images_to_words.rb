class AddImagesToWords < ActiveRecord::Migration[5.1]
  def change
    add_column :words, :images, :text, array: true, default: []
  end
end
