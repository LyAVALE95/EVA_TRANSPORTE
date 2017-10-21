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

ActiveRecord::Schema.define(version: 20171021233011) do

  create_table "audits", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "results"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "load_id"
    t.index ["load_id"], name: "index_audits_on_load_id"
  end

  create_table "carrier_lines", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name"
    t.string "legalName"
    t.string "tel"
    t.string "mail"
    t.string "comercialBusiness"
    t.boolean "active"
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "location_id"
    t.index ["location_id"], name: "index_carrier_lines_on_location_id"
  end

  create_table "clientcontacts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "names"
    t.string "lastnames"
    t.string "note"
    t.string "tel"
    t.string "movil"
    t.string "mail"
    t.string "hiredate"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "customer_id"
    t.bigint "warehouse_id"
    t.index ["customer_id"], name: "index_clientcontacts_on_customer_id"
    t.index ["warehouse_id"], name: "index_clientcontacts_on_warehouse_id"
  end

  create_table "companies", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name"
    t.string "legalName"
    t.string "code"
    t.string "tel"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "location_id"
    t.index ["location_id"], name: "index_companies_on_location_id"
  end

  create_table "company_lines", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "carrier_line_id"
    t.bigint "company_id"
    t.index ["carrier_line_id"], name: "index_company_lines_on_carrier_line_id"
    t.index ["company_id"], name: "index_company_lines_on_company_id"
  end

  create_table "customers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "names"
    t.string "lastnames"
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "country"
    t.string "region"
    t.string "cp"
    t.string "notes"
    t.string "tel"
    t.string "movil"
    t.string "schedule"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "company_id"
    t.bigint "user_id"
    t.index ["company_id"], name: "index_customers_on_company_id"
    t.index ["user_id"], name: "index_customers_on_user_id"
  end

  create_table "drivers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "code"
    t.string "department"
    t.string "names"
    t.string "lastnames"
    t.string "rfc"
    t.datetime "hiredDate"
    t.datetime "birthday"
    t.string "address"
    t.string "state"
    t.string "movil"
    t.string "tel"
    t.string "cp"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "carrier_line_id"
    t.bigint "license_id"
    t.bigint "truck_id"
    t.bigint "user_id"
    t.index ["carrier_line_id"], name: "index_drivers_on_carrier_line_id"
    t.index ["license_id"], name: "index_drivers_on_license_id"
    t.index ["truck_id"], name: "index_drivers_on_truck_id"
    t.index ["user_id"], name: "index_drivers_on_user_id"
  end

  create_table "licenses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "type"
    t.float "cost", limit: 24
    t.datetime "validity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "loads", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.datetime "arrivalDate"
    t.string "packageNumber"
    t.string "details"
    t.boolean "check"
    t.float "cost", limit: 24
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "customer_id"
    t.bigint "warehouse_id"
    t.bigint "carrier_line_id"
    t.bigint "state_id"
    t.bigint "type_scaffolds_id"
    t.index ["carrier_line_id"], name: "index_loads_on_carrier_line_id"
    t.index ["customer_id"], name: "index_loads_on_customer_id"
    t.index ["state_id"], name: "index_loads_on_state_id"
    t.index ["type_scaffolds_id"], name: "index_loads_on_type_scaffolds_id"
    t.index ["warehouse_id"], name: "index_loads_on_warehouse_id"
  end

  create_table "locations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "RFID"
    t.string "name"
    t.string "address"
    t.string "coordinates"
    t.string "street"
    t.string "district"
    t.string "extnum"
    t.string "intnum"
    t.string "zipCode"
    t.string "region"
    t.string "city"
    t.string "state"
    t.string "country"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "packages", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "quantity"
    t.float "cost", limit: 24
    t.string "size"
    t.string "weigth"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "type_scaffold_id"
    t.bigint "load_id"
    t.bigint "state_id"
    t.index ["load_id"], name: "index_packages_on_load_id"
    t.index ["state_id"], name: "index_packages_on_state_id"
    t.index ["type_scaffold_id"], name: "index_packages_on_type_scaffold_id"
  end

  create_table "rate_expenses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name"
    t.string "description"
    t.boolean "active"
    t.float "cost", limit: 24
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stands", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name"
    t.string "description"
    t.string "timeMax"
    t.string "extSpent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "location_id"
    t.bigint "state_id"
    t.bigint "rate_expense_id"
    t.index ["location_id"], name: "index_stands_on_location_id"
    t.index ["rate_expense_id"], name: "index_stands_on_rate_expense_id"
    t.index ["state_id"], name: "index_stands_on_state_id"
  end

  create_table "states", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name"
    t.string "code"
    t.string "grade"
    t.string "protocol"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "travel_stands", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.time "estimatedTime"
    t.time "realTime"
    t.datetime "dateOpen"
    t.datetime "dateClose"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "travels", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "gpsReads"
    t.datetime "gpsDate"
    t.string "details"
    t.float "cost", limit: 24
    t.string "kms"
    t.time "hoursPlanned"
    t.time "hoursTraveled"
    t.string "idOrigen"
    t.string "idDestine"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "carrier_line_id"
    t.bigint "company_id"
    t.bigint "load_id"
    t.bigint "driver_id"
    t.bigint "state_id"
    t.bigint "truck_id"
    t.bigint "mt_id"
    t.index ["carrier_line_id"], name: "index_travels_on_carrier_line_id"
    t.index ["company_id"], name: "index_travels_on_company_id"
    t.index ["driver_id"], name: "index_travels_on_driver_id"
    t.index ["load_id"], name: "index_travels_on_load_id"
    t.index ["mt_id"], name: "index_travels_on_mt_id"
    t.index ["state_id"], name: "index_travels_on_state_id"
    t.index ["truck_id"], name: "index_travels_on_truck_id"
  end

  create_table "trucks", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "enrollment"
    t.string "model"
    t.string "quality"
    t.string "mileage"
    t.string "wheels"
    t.string "gas"
    t.string "loadCapacity"
    t.string "year"
    t.string "producer"
    t.string "BoxSize"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "license_id"
    t.index ["license_id"], name: "index_trucks_on_license_id"
  end

  create_table "type_scaffolds", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "description"
    t.string "weigth"
    t.string "size"
    t.string "category"
    t.float "cost", limit: 24
    t.string "extraHours"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "license_id"
    t.index ["license_id"], name: "index_type_scaffolds_on_license_id"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "rol"
    t.string "description"
    t.datetime "birthday"
    t.datetime "hireDate"
    t.boolean "active"
    t.string "section"
    t.string "category"
    t.string "RFC"
    t.string "address"
    t.string "district"
    t.string "intnum"
    t.string "extnum"
    t.string "state"
    t.string "zipcode"
    t.string "country"
    t.string "tel"
    t.string "telMov"
    t.string "schedule"
    t.string "note"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "carrier_line_id"
    t.bigint "company_id"
    t.string "authentication_token", limit: 30
    t.index ["carrier_line_id"], name: "index_users_on_carrier_line_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "warehouses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name"
    t.string "scheduleStart"
    t.string "scheduleEnd"
    t.string "scheduleDays"
    t.string "tel"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "location_id"
    t.bigint "company_id"
    t.bigint "clientcontact_id"
    t.index ["clientcontact_id"], name: "index_warehouses_on_clientcontact_id"
    t.index ["company_id"], name: "index_warehouses_on_company_id"
    t.index ["location_id"], name: "index_warehouses_on_location_id"
  end

  add_foreign_key "audits", "loads"
  add_foreign_key "carrier_lines", "locations"
  add_foreign_key "clientcontacts", "customers"
  add_foreign_key "clientcontacts", "warehouses"
  add_foreign_key "companies", "locations"
  add_foreign_key "company_lines", "carrier_lines"
  add_foreign_key "company_lines", "companies"
  add_foreign_key "customers", "companies"
  add_foreign_key "customers", "users"
  add_foreign_key "drivers", "carrier_lines"
  add_foreign_key "drivers", "licenses"
  add_foreign_key "drivers", "trucks"
  add_foreign_key "drivers", "users"
  add_foreign_key "loads", "carrier_lines"
  add_foreign_key "loads", "customers"
  add_foreign_key "loads", "states"
  add_foreign_key "loads", "type_scaffolds", column: "type_scaffolds_id"
  add_foreign_key "loads", "warehouses"
  add_foreign_key "packages", "loads"
  add_foreign_key "packages", "states"
  add_foreign_key "packages", "type_scaffolds"
  add_foreign_key "stands", "locations"
  add_foreign_key "stands", "rate_expenses"
  add_foreign_key "stands", "states"
  add_foreign_key "travels", "carrier_lines"
  add_foreign_key "travels", "companies"
  add_foreign_key "travels", "drivers"
  add_foreign_key "travels", "loads"
  add_foreign_key "travels", "mts"
  add_foreign_key "travels", "states"
  add_foreign_key "travels", "trucks"
  add_foreign_key "trucks", "licenses"
  add_foreign_key "type_scaffolds", "licenses"
  add_foreign_key "users", "carrier_lines"
  add_foreign_key "warehouses", "clientcontacts"
  add_foreign_key "warehouses", "companies"
  add_foreign_key "warehouses", "locations"
end
