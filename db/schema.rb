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

ActiveRecord::Schema.define(version: 20161119010935) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accesses", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "laboratory_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["laboratory_id"], name: "index_accesses_on_laboratory_id", using: :btree
    t.index ["user_id"], name: "index_accesses_on_user_id", using: :btree
  end

  create_table "actions", force: :cascade do |t|
    t.text     "body"
    t.integer  "experiment_id"
    t.integer  "last_updator_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["experiment_id"], name: "index_actions_on_experiment_id", using: :btree
    t.index ["last_updator_id"], name: "index_actions_on_last_updator_id", using: :btree
  end

  create_table "assumptions", force: :cascade do |t|
    t.string   "body"
    t.integer  "experiment_id"
    t.integer  "last_updator_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["experiment_id"], name: "index_assumptions_on_experiment_id", using: :btree
    t.index ["last_updator_id"], name: "index_assumptions_on_last_updator_id", using: :btree
  end

  create_table "experiments", force: :cascade do |t|
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "laboratory_id"
    t.index ["laboratory_id"], name: "index_experiments_on_laboratory_id", using: :btree
  end

  create_table "laboratories", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "slug"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "results", force: :cascade do |t|
    t.text     "body"
    t.integer  "experiment_id"
    t.integer  "last_updator_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["experiment_id"], name: "index_results_on_experiment_id", using: :btree
    t.index ["last_updator_id"], name: "index_results_on_last_updator_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "full_name"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "accesses", "laboratories"
  add_foreign_key "accesses", "users"
  add_foreign_key "actions", "experiments"
  add_foreign_key "assumptions", "experiments"
  add_foreign_key "experiments", "laboratories"
  add_foreign_key "results", "experiments"
end
