# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180305172437) do

  create_table "antonyms", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "word_id"
    t.bigint "meaning_id"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["meaning_id"], name: "index_antonyms_on_meaning_id"
    t.index ["word_id"], name: "index_antonyms_on_word_id"
  end

  create_table "dictionaries", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "homepage"
    t.string "api_homepage"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "examples", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "meaning_id"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["meaning_id"], name: "index_examples_on_meaning_id"
  end

  create_table "favorites", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "user_id"
    t.bigint "word_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_favorites_on_user_id"
    t.index ["word_id"], name: "index_favorites_on_word_id"
  end

  create_table "listening_lessons", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "link"
    t.text "script"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "meanings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "word_id"
    t.bigint "dictionary_id"
    t.text "definition"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dictionary_id"], name: "index_meanings_on_dictionary_id"
    t.index ["word_id"], name: "index_meanings_on_word_id"
  end

  create_table "pronunciations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "word_id"
    t.string "audio_link"
    t.string "dialects"
    t.string "phonetic_notation"
    t.string "phonetic_spelling"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["word_id"], name: "index_pronunciations_on_word_id"
  end

  create_table "submitted_scripts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "user_id"
    t.bigint "listening_lesson_id"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["listening_lesson_id"], name: "index_submitted_scripts_on_listening_lesson_id"
    t.index ["user_id"], name: "index_submitted_scripts_on_user_id"
  end

  create_table "synonyms", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "word_id"
    t.bigint "meaning_id"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["meaning_id"], name: "index_synonyms_on_meaning_id"
    t.index ["word_id"], name: "index_synonyms_on_word_id"
  end

  create_table "translation_histories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "user_id"
    t.bigint "word_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_translation_histories_on_user_id"
    t.index ["word_id"], name: "index_translation_histories_on_word_id"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "username", default: "", null: false
    t.string "fullname", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  create_table "words", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.boolean "updated", default: false
    t.string "language", default: "en"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "antonyms", "meanings"
  add_foreign_key "antonyms", "words"
  add_foreign_key "examples", "meanings"
  add_foreign_key "favorites", "users"
  add_foreign_key "favorites", "words"
  add_foreign_key "meanings", "dictionaries"
  add_foreign_key "meanings", "words"
  add_foreign_key "pronunciations", "words"
  add_foreign_key "submitted_scripts", "listening_lessons"
  add_foreign_key "submitted_scripts", "users"
  add_foreign_key "synonyms", "meanings"
  add_foreign_key "synonyms", "words"
  add_foreign_key "translation_histories", "users"
  add_foreign_key "translation_histories", "words"
end
