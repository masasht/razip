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

ActiveRecord::Schema.define(version: 20180217022912) do

  create_table "battery_selections", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "battery_type"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "brush_selections", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "motor_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "category_selections", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clips", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.integer  "machine_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["machine_id"], name: "index_clips_on_machine_id", using: :btree
    t.index ["user_id", "machine_id"], name: "index_clips_on_user_id_and_machine_id", unique: true, using: :btree
    t.index ["user_id"], name: "index_clips_on_user_id", using: :btree
  end

  create_table "drive_selections", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "drive_system"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "escs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "image"
    t.integer  "maker_id"
    t.string   "maker_url"
    t.integer  "list_price"
    t.string   "motor_type"
    t.string   "sencor"
    t.string   "lipo"
    t.string   "life"
    t.string   "nimh"
    t.string   "nicd"
    t.string   "input_current"
    t.integer  "output_current_max"
    t.integer  "output_current"
    t.string   "bec"
    t.text     "information",        limit: 65535
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "user_id"
    t.float    "turn",               limit: 24
    t.float    "ohm",                limit: 24
    t.index ["maker_id"], name: "index_escs_on_maker_id", using: :btree
    t.index ["user_id"], name: "index_escs_on_user_id", using: :btree
  end

  create_table "frequency_selections", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "frequency_type"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "kits", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "image"
    t.integer  "maker_id"
    t.string   "maker_url"
    t.integer  "list_price"
    t.string   "category"
    t.string   "drive_system"
    t.text     "information",  limit: 65535
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "user_id"
    t.index ["maker_id"], name: "index_kits_on_maker_id", using: :btree
    t.index ["user_id"], name: "index_kits_on_user_id", using: :btree
  end

  create_table "machines", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "machine_name"
    t.text     "image",        limit: 65535
    t.integer  "user_id"
    t.integer  "kit_id"
    t.integer  "motor_id"
    t.integer  "esc_id"
    t.integer  "servo_id"
    t.integer  "recevier_id"
    t.string   "regulation"
    t.text     "other",        limit: 65535
    t.text     "information",  limit: 65535
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "maker_id"
    t.index ["esc_id"], name: "index_machines_on_esc_id", using: :btree
    t.index ["kit_id"], name: "index_machines_on_kit_id", using: :btree
    t.index ["motor_id"], name: "index_machines_on_motor_id", using: :btree
    t.index ["recevier_id"], name: "index_machines_on_recevier_id", using: :btree
    t.index ["servo_id"], name: "index_machines_on_servo_id", using: :btree
    t.index ["user_id"], name: "index_machines_on_user_id", using: :btree
  end

  create_table "makers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "maker_name"
    t.string   "official_url"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "user_id"
    t.boolean  "supply_kit",      default: false, null: false
    t.boolean  "supply_motor",    default: false, null: false
    t.boolean  "supply_esc",      default: false, null: false
    t.boolean  "supply_servo",    default: false, null: false
    t.boolean  "supply_recevier", default: false, null: false
    t.index ["user_id"], name: "index_makers_on_user_id", using: :btree
  end

  create_table "microposts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "content"
    t.integer  "user_id"
    t.integer  "machine_id"
    t.integer  "kit_id"
    t.integer  "motor_id"
    t.integer  "esc_id"
    t.integer  "servo_id"
    t.integer  "recevier_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["esc_id"], name: "index_microposts_on_esc_id", using: :btree
    t.index ["kit_id"], name: "index_microposts_on_kit_id", using: :btree
    t.index ["machine_id"], name: "index_microposts_on_machine_id", using: :btree
    t.index ["motor_id"], name: "index_microposts_on_motor_id", using: :btree
    t.index ["recevier_id"], name: "index_microposts_on_recevier_id", using: :btree
    t.index ["servo_id"], name: "index_microposts_on_servo_id", using: :btree
    t.index ["user_id"], name: "index_microposts_on_user_id", using: :btree
  end

  create_table "motors", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "image"
    t.integer  "maker_id"
    t.string   "maker_url"
    t.integer  "list_price"
    t.string   "brush"
    t.string   "sencor"
    t.float    "turn",        limit: 24
    t.integer  "kv"
    t.string   "rpm"
    t.string   "torque"
    t.string   "voltage"
    t.integer  "ampere"
    t.text     "information", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "user_id"
    t.index ["maker_id"], name: "index_motors_on_maker_id", using: :btree
    t.index ["user_id"], name: "index_motors_on_user_id", using: :btree
  end

  create_table "profile_selections", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "profile_type"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "receviers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "image"
    t.integer  "maker_id"
    t.string   "maker_url"
    t.integer  "list_price"
    t.string   "frequency"
    t.integer  "channel"
    t.string   "dimensions"
    t.string   "weight"
    t.text     "information", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "user_id"
    t.index ["maker_id"], name: "index_receviers_on_maker_id", using: :btree
    t.index ["user_id"], name: "index_receviers_on_user_id", using: :btree
  end

  create_table "relationships", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.integer  "follow_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["follow_id"], name: "index_relationships_on_follow_id", using: :btree
    t.index ["user_id", "follow_id"], name: "index_relationships_on_user_id_and_follow_id", unique: true, using: :btree
    t.index ["user_id"], name: "index_relationships_on_user_id", using: :btree
  end

  create_table "sencor_selections", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "sensor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "servo_selections", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "servo_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "servos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "image"
    t.integer  "maker_id"
    t.string   "maker_url"
    t.integer  "list_price"
    t.string   "servo_type"
    t.string   "profile"
    t.float    "speed_74",    limit: 24
    t.float    "torque_74",   limit: 24
    t.string   "dimensions"
    t.string   "weight"
    t.text     "information", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "user_id"
    t.float    "speed_60",    limit: 24
    t.float    "speed_48",    limit: 24
    t.float    "torque_60",   limit: 24
    t.float    "torque_48",   limit: 24
    t.index ["maker_id"], name: "index_servos_on_maker_id", using: :btree
    t.index ["user_id"], name: "index_servos_on_user_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "site_url"
    t.text     "user_introduction", limit: 65535
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "site_name"
    t.string   "user_class",                      default: "未設定"
    t.boolean  "admin",                           default: false
    t.string   "provider"
    t.string   "uid"
    t.string   "nickname"
  end

  add_foreign_key "clips", "machines"
  add_foreign_key "clips", "users"
  add_foreign_key "escs", "makers"
  add_foreign_key "escs", "users"
  add_foreign_key "kits", "makers"
  add_foreign_key "kits", "users"
  add_foreign_key "machines", "escs"
  add_foreign_key "machines", "kits"
  add_foreign_key "machines", "motors"
  add_foreign_key "machines", "receviers"
  add_foreign_key "machines", "servos"
  add_foreign_key "machines", "users"
  add_foreign_key "makers", "users"
  add_foreign_key "microposts", "escs"
  add_foreign_key "microposts", "kits"
  add_foreign_key "microposts", "machines"
  add_foreign_key "microposts", "motors"
  add_foreign_key "microposts", "receviers"
  add_foreign_key "microposts", "servos"
  add_foreign_key "microposts", "users"
  add_foreign_key "motors", "makers"
  add_foreign_key "motors", "users"
  add_foreign_key "receviers", "makers"
  add_foreign_key "receviers", "users"
  add_foreign_key "relationships", "users"
  add_foreign_key "relationships", "users", column: "follow_id"
  add_foreign_key "servos", "makers"
  add_foreign_key "servos", "users"
end
