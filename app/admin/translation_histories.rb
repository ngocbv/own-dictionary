ActiveAdmin.register TranslationHistory do
  permit_params :user_id, :word_id

  index do
    selectable_column
    id_column
    column :user
    column :word
    column :translated_count
    column :created_at
    column :updated_at
    actions
  end
end
