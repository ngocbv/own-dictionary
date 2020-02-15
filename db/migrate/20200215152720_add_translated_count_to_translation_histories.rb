class AddTranslatedCountToTranslationHistories < ActiveRecord::Migration[5.1]
  def change
    add_column :translation_histories, :translated_count, :integer, default: 1
  end
end
