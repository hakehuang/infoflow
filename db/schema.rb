# encoding: UTF-8
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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121026144619) do

  create_table "contracts", :force => true do |t|
    t.string   "No"
    t.string   "summary"
    t.date     "prefoma_sales_contract"
    t.date     "deposit_rcvd"
    t.date     "expected_ship_date"
    t.integer  "customer_id"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
    t.integer  "user_id"
  end

  add_index "contracts", ["No"], :name => "index_contracts_on_No", :unique => true
  add_index "contracts", ["customer_id"], :name => "index_contracts_on_customer_id"

  create_table "contracts_products", :force => true do |t|
    t.integer "contract_id"
    t.integer "product_id"
  end

  create_table "customers", :force => true do |t|
    t.string   "Market"
    t.string   "name"
    t.string   "Address"
    t.decimal  "Postal_Code",                    :precision => 10, :scale => 0
    t.string   "city"
    t.string   "Country"
    t.decimal  "Tel",                            :precision => 10, :scale => 0
    t.decimal  "Fax",                            :precision => 10, :scale => 0
    t.string   "Contactor_a"
    t.string   "Contactor_b"
    t.string   "cell_a"
    t.string   "cell_b"
    t.string   "web_page"
    t.string   "Email"
    t.string   "MSN"
    t.string   "Skype"
    t.text     "Invoicing_Requirement"
    t.text     "shipping_Document_requirements"
    t.datetime "created_at",                                                    :null => false
    t.datetime "updated_at",                                                    :null => false
    t.integer  "user_id"
  end

  create_table "manufactures", :force => true do |t|
    t.string   "name"
    t.string   "location"
    t.decimal  "tel",         :precision => 10, :scale => 0
    t.decimal  "fax",         :precision => 10, :scale => 0
    t.string   "address"
    t.string   "contactor_a"
    t.string   "contactor_b"
    t.string   "cell_a"
    t.string   "cell_b"
    t.string   "web_page"
    t.string   "email"
    t.string   "msn"
    t.string   "skype"
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
  end

  create_table "manufactures_products", :force => true do |t|
    t.integer  "manufacture_id"
    t.integer  "product_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "productions", :force => true do |t|
    t.date     "factory_counter_sample_date"
    t.date     "customer_approval_of_counter_sample_date"
    t.date     "start_date"
    t.date     "pre_production_sample_approval_date"
    t.date     "qc_during_production_date"
    t.date     "final_qc_date"
    t.integer  "user_id"
    t.integer  "project_id"
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
  end

  create_table "products", :force => true do |t|
    t.string   "name"
    t.string   "certification"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "serial_no"
  end

  add_index "products", ["serial_no"], :name => "index_products_on_serial_no", :unique => true

  create_table "projects", :force => true do |t|
    t.integer  "user_id"
    t.integer  "contract_id"
    t.string   "inquiry_from"
    t.date     "start_date"
    t.date     "rcv_customer_sample_date"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  create_table "roles", :force => true do |t|
    t.string   "role"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "shipments", :force => true do |t|
    t.date     "lead_time"
    t.date     "actual_ship_date"
    t.date     "tax_return_date"
    t.string   "writeoff"
    t.integer  "project_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "failed_attempts",        :default => 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "username"
    t.boolean  "admin"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "versions", :force => true do |t|
    t.string   "item_type",  :null => false
    t.integer  "item_id",    :null => false
    t.string   "event",      :null => false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
  end

  add_index "versions", ["item_type", "item_id"], :name => "index_versions_on_item_type_and_item_id"

end
