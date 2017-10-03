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

ActiveRecord::Schema.define(version: 20171003032519) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dictionaries", force: :cascade do |t|
    t.string "name"
    t.string "homepage"
    t.string "api_homepage"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "examples", force: :cascade do |t|
    t.bigint "meaning_id"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["meaning_id"], name: "index_examples_on_meaning_id"
  end

  create_table "meanings", force: :cascade do |t|
    t.bigint "word_id"
    t.bigint "dictionary_id"
    t.text "definition"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dictionary_id"], name: "index_meanings_on_dictionary_id"
    t.index ["word_id"], name: "index_meanings_on_word_id"
  end

  create_table "pronunciations", force: :cascade do |t|
    t.bigint "word_id"
    t.string "audio_link"
    t.string "dialects"
    t.string "phonetic_notation"
    t.string "phonetic_spelling"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["word_id"], name: "index_pronunciations_on_word_id"
  end

  create_table "words", force: :cascade do |t|
    t.string "name"
    t.boolean "updated", default: false
    t.string "language", default: "en"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "examples", "meanings"
  add_foreign_key "meanings", "dictionaries"
  add_foreign_key "meanings", "words"
  add_foreign_key "pronunciations", "words"
end
