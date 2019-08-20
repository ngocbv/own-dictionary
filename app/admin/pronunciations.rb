ActiveAdmin.register Pronunciation do
  permit_params :word_id, :audio_link, :dialects, :phonetic_notation, :phonetic_spelling
end
