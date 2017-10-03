# Own Dictionary

Dictionaries:
  - name: unique, string
  - homepage
  - api_homepage

Words:
  - name: string, unique
  - updated: bool, default: false
  - language

Meanings:
  - word_id
  - dictionary_id
  - definition

Examples:
  - meaning_id
  - content

Pronunciations:
  - word_id
  - audio_link
  - dialects: array of dialects
  - phonetic_notation
  - phonetic_spelling

Users:
  - username
  - email
  - fullname
  - encrypted_password

FavoriteWords:
  - user_id
  - word_id

TranslationHistories:
  - user_id
  - word_id
  - time: datetime

Sentences:
  - word_id
  - regions: arrays of regions
  - content: text

Synonyms:
  - word_id
  - dictionary_id
  - content: array of synonyms

Antonyms:
  - word_id
  - dictionary_id
  - content: array of antonyms
