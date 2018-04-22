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

ActiveRecord::Schema.define(version: 20180422174905) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", id: :serial, force: :cascade do |t|
    t.string "street"
    t.string "district"
    t.string "number"
    t.string "zip"
    t.string "city"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "militaries", id: :serial, force: :cascade do |t|
    t.string "name"
    t.integer "rank"
    t.string "registration"
    t.date "admission_date"
    t.integer "t_shirt_size"
    t.integer "boot_size"
    t.integer "beret_size"
    t.integer "pants_size"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_militaries_on_user_id"
  end

  create_table "opms", id: :serial, force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "address", default: "", null: false
    t.string "zip_code", default: "", null: false
    t.integer "parent_id"
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parent_id"], name: "index_opms_on_parent_id"
  end

  create_table "pacientes", force: :cascade do |t|
    t.string "nome"
    t.string "cep"
    t.string "complemento"
    t.string "telefone"
    t.string "email"
    t.date "data_nasc"
    t.string "sexo"
    t.string "escolaridade"
    t.string "naturalidade"
    t.string "estado_civil"
    t.boolean "filhos"
    t.integer "qnt_filhos"
    t.string "profissao"
    t.string "religiao"
    t.boolean "pm"
    t.integer "matricula"
    t.integer "rg"
    t.string "graduacao"
    t.string "unidade"
    t.string "subunidade"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "people", id: :serial, force: :cascade do |t|
    t.string "full_name"
    t.date "birth_date"
    t.string "cpf"
    t.string "home_phone"
    t.string "mobile_phone"
    t.string "rg"
    t.integer "address_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_people_on_address_id"
  end

  create_table "permission_roles", id: :serial, force: :cascade do |t|
    t.integer "permission_id"
    t.integer "role_id"
    t.index ["permission_id"], name: "index_permission_roles_on_permission_id"
    t.index ["role_id"], name: "index_permission_roles_on_role_id"
  end

  create_table "permissions", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "placements", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "opm_id"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["opm_id"], name: "index_placements_on_opm_id"
    t.index ["user_id"], name: "index_placements_on_user_id"
  end

  create_table "roles", id: :serial, force: :cascade do |t|
    t.string "name", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "situations", id: :serial, force: :cascade do |t|
    t.string "status"
    t.string "functional"
    t.string "medical"
    t.string "juridical"
    t.string "special"
    t.string "alienation"
    t.string "disciplinary"
    t.string "gun_license"
    t.integer "military_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["military_id"], name: "index_situations_on_military_id"
  end

  create_table "triagems", force: :cascade do |t|
    t.string "nome_paciente"
    t.text "desc_hist_tratamento"
    t.text "desc_hist_medic"
    t.boolean "psicoterapia"
    t.text "queixa"
    t.string "estado_paciente"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_permissions", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "permission_id"
    t.string "category", default: "funcional", null: false
    t.index ["permission_id"], name: "index_user_permissions_on_permission_id"
    t.index ["user_id"], name: "index_user_permissions_on_user_id"
  end

  create_table "user_roles", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_user_roles_on_role_id"
    t.index ["user_id"], name: "index_user_roles_on_user_id"
  end

  create_table "user_sessions", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.string "token", default: "", null: false
    t.datetime "expire_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_sessions_on_user_id"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.boolean "military", default: true, null: false
    t.boolean "inactive", default: false, null: false
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "opm_id"
    t.integer "person_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["opm_id"], name: "index_users_on_opm_id"
    t.index ["person_id"], name: "index_users_on_person_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  create_table "versions", id: :serial, force: :cascade do |t|
    t.string "item_type", null: false
    t.integer "item_id", null: false
    t.string "event", null: false
    t.string "whodunnit"
    t.text "object"
    t.datetime "created_at"
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"
  end

  add_foreign_key "militaries", "users"
  add_foreign_key "people", "addresses"
  add_foreign_key "permission_roles", "permissions"
  add_foreign_key "permission_roles", "roles"
  add_foreign_key "placements", "opms"
  add_foreign_key "placements", "users"
  add_foreign_key "situations", "militaries"
  add_foreign_key "user_permissions", "permissions"
  add_foreign_key "user_permissions", "users"
  add_foreign_key "user_roles", "roles"
  add_foreign_key "user_roles", "users"
  add_foreign_key "user_sessions", "users"
  add_foreign_key "users", "opms"
  add_foreign_key "users", "people"
end
