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

ActiveRecord::Schema.define(version: 20181106190915) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "user_name"
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "annual_claim_rate_lists", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "value"
  end

  create_table "areas", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "benefits_lists", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "candidate_companies", force: :cascade do |t|
    t.bigint "candidate_id"
    t.string "name"
    t.integer "months"
    t.integer "size"
    t.integer "sector"
    t.integer "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "start_date_month"
    t.integer "start_date_year"
    t.integer "end_date_month"
    t.integer "end_date_year"
    t.index ["candidate_id"], name: "index_candidate_companies_on_candidate_id"
  end

  create_table "candidate_current_companies", force: :cascade do |t|
    t.bigint "candidate_id"
    t.string "name"
    t.date "start_date"
    t.date "end_date"
    t.string "company_size"
    t.string "sector"
    t.string "mode"
    t.string "city"
    t.string "city_locale"
    t.string "neighborhood"
    t.string "corporate_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "start_date_month"
    t.integer "start_date_year"
    t.integer "end_date_month"
    t.integer "end_date_year"
    t.boolean "currently_work_here", default: false
    t.index ["candidate_id"], name: "index_candidate_current_companies_on_candidate_id"
  end

  create_table "candidate_education_languages", force: :cascade do |t|
    t.bigint "candidate_education_id"
    t.bigint "language_id"
    t.bigint "language_level_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["candidate_education_id"], name: "index_candidate_education_languages_on_candidate_education_id"
  end

  create_table "candidate_educations", force: :cascade do |t|
    t.bigint "candidate_id"
    t.integer "degree"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["candidate_id"], name: "index_candidate_educations_on_candidate_id"
  end

  create_table "candidate_experience_functions", force: :cascade do |t|
    t.bigint "candidate_experience_id"
    t.integer "function_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "percentage"
    t.index ["candidate_experience_id"], name: "index_candidate_experience_functions_on_candidate_experience_id"
  end

  create_table "candidate_experience_titles", force: :cascade do |t|
    t.bigint "candidate_experience_id"
    t.integer "title_id"
    t.integer "years"
    t.integer "months"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["candidate_experience_id"], name: "index_candidate_experience_titles_on_candidate_experience_id"
  end

  create_table "candidate_experiences", force: :cascade do |t|
    t.bigint "candidate_id"
    t.integer "current_title"
    t.integer "areas", default: [], array: true
    t.integer "functions", default: [], array: true
    t.integer "disconsidered_functions", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "considered_functions", default: [], array: true
    t.integer "total_functions_percentage", default: 0
    t.integer "others_percentage"
    t.index ["candidate_id"], name: "index_candidate_experiences_on_candidate_id"
  end

  create_table "candidate_habilities", force: :cascade do |t|
    t.bigint "candidate_id"
    t.integer "habilities", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["candidate_id"], name: "index_candidate_habilities_on_candidate_id"
  end

  create_table "candidate_interests", force: :cascade do |t|
    t.bigint "candidate_id"
    t.integer "locales", default: [], array: true
    t.integer "company_sizes", default: [], array: true
    t.integer "modes", default: [], array: true
    t.integer "sectors", default: [], array: true
    t.integer "relevances", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "cities", default: [], array: true
    t.integer "areas", default: [], array: true
    t.integer "neighborhoods", default: [], array: true
    t.index ["candidate_id"], name: "index_candidate_interests_on_candidate_id"
  end

  create_table "candidate_pretensions", force: :cascade do |t|
    t.bigint "candidate_id"
    t.decimal "last_monthly_salary", precision: 15, scale: 2
    t.decimal "nofsalaries"
    t.decimal "variable", precision: 15, scale: 2
    t.decimal "last_salary_total", precision: 15, scale: 2
    t.decimal "pretension_minimum_percent"
    t.decimal "pretension_yearly_total", precision: 15, scale: 2
    t.integer "benefits", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "minimum_claim"
    t.decimal "bonus_or_plr"
    t.decimal "total_pretended_from", precision: 8, scale: 2
    t.index ["candidate_id"], name: "index_candidate_pretensions_on_candidate_id"
  end

  create_table "candidate_process_selections", force: :cascade do |t|
    t.bigint "process_selection_id"
    t.bigint "candidate_id"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["candidate_id"], name: "index_candidate_process_selections_on_candidate_id"
    t.index ["process_selection_id"], name: "index_candidate_process_selections_on_process_selection_id"
  end

  create_table "candidates", force: :cascade do |t|
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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "signup_state"
    t.string "name"
    t.string "cellphone"
    t.string "cpf"
    t.string "candidate_avatar"
    t.string "candidate_curriculum"
    t.boolean "new_challenges", default: false
    t.boolean "employed", default: false
    t.index ["email"], name: "index_candidates_on_email", unique: true
    t.index ["reset_password_token"], name: "index_candidates_on_reset_password_token", unique: true
  end

  create_table "cities", force: :cascade do |t|
    t.bigint "state_id"
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_cities_on_name", unique: true
    t.index ["state_id"], name: "index_cities_on_state_id"
  end

  create_table "city_locales", force: :cascade do |t|
    t.string "name"
    t.bigint "city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "priority", default: 1000
    t.string "code"
    t.index ["city_id"], name: "index_city_locales_on_city_id"
  end

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string "data_file_name", null: false
    t.string "data_content_type"
    t.integer "data_file_size"
    t.string "data_fingerprint"
    t.string "type", limit: 30
    t.integer "width"
    t.integer "height"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["type"], name: "index_ckeditor_assets_on_type"
  end

  create_table "companies", force: :cascade do |t|
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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "cpf_cnpj"
    t.index ["email"], name: "index_companies_on_email", unique: true
    t.index ["reset_password_token"], name: "index_companies_on_reset_password_token", unique: true
  end

  create_table "company_abouts", force: :cascade do |t|
    t.bigint "company_id"
    t.bigint "company_size_id"
    t.bigint "mode_id"
    t.integer "sectors", default: [], array: true
    t.integer "neighborhoods", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_company_abouts_on_company_id"
  end

  create_table "company_sizes", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "score"
    t.string "code"
  end

  create_table "countries", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "country_locales", force: :cascade do |t|
    t.string "name"
    t.bigint "country_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_country_locales_on_country_id"
  end

  create_table "education_lists", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "functions", force: :cascade do |t|
    t.string "name"
    t.bigint "area_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["area_id"], name: "index_functions_on_area_id"
  end

  create_table "habilities", force: :cascade do |t|
    t.string "name"
    t.bigint "function_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["function_id"], name: "index_habilities_on_function_id"
  end

  create_table "language_level_lists", force: :cascade do |t|
    t.text "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "language_lists", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "modes", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "score"
    t.string "code"
  end

  create_table "neighborhoods", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.bigint "city_id"
    t.bigint "city_locale_id"
    t.string "code"
    t.index ["city_id"], name: "index_neighborhoods_on_city_id"
    t.index ["city_locale_id"], name: "index_neighborhoods_on_city_locale_id"
  end

  create_table "nofsalaries_lists", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "value"
  end

  create_table "package_services", force: :cascade do |t|
    t.string "package_title"
    t.text "description"
    t.boolean "signature"
    t.decimal "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "positions", force: :cascade do |t|
    t.string "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "process_selection_candidates", force: :cascade do |t|
    t.bigint "process_selection_id"
    t.bigint "candidate_id"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["candidate_id"], name: "index_process_selection_candidates_on_candidate_id"
    t.index ["process_selection_id"], name: "index_process_selection_candidates_on_process_selection_id"
  end

  create_table "process_selections", force: :cascade do |t|
    t.bigint "company_id"
    t.string "owner_type"
    t.bigint "owner_id"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "min_time_function"
    t.integer "min_time_title"
    t.integer "min_anual_salary"
    t.integer "max_anual_salary"
    t.bigint "area_id"
    t.bigint "function_id"
    t.bigint "title_list_id"
    t.bigint "education_list_id"
    t.bigint "language_list_id"
    t.integer "prior_experience"
    t.index ["area_id"], name: "index_process_selections_on_area_id"
    t.index ["company_id"], name: "index_process_selections_on_company_id"
    t.index ["education_list_id"], name: "index_process_selections_on_education_list_id"
    t.index ["function_id"], name: "index_process_selections_on_function_id"
    t.index ["language_list_id"], name: "index_process_selections_on_language_list_id"
    t.index ["owner_type", "owner_id"], name: "index_process_selections_on_owner_type_and_owner_id"
    t.index ["title_list_id"], name: "index_process_selections_on_title_list_id"
  end

  create_table "range_lists", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "relevances", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "priority"
  end

  create_table "sectors", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nickname"
    t.decimal "score"
    t.string "code"
  end

  create_table "sort_lists", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "specialties", force: :cascade do |t|
    t.string "specialty"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "states", force: :cascade do |t|
    t.bigint "country_id"
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_states_on_country_id"
    t.index ["name"], name: "index_states_on_name", unique: true
  end

  create_table "status_lists", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "step_lists", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "term_accepts", force: :cascade do |t|
    t.string "acceptable_type"
    t.bigint "acceptable_id"
    t.bigint "term_id"
    t.boolean "accepted", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["acceptable_type", "acceptable_id"], name: "index_term_accepts_on_acceptable_type_and_acceptable_id"
    t.index ["term_id"], name: "index_term_accepts_on_term_id"
  end

  create_table "terms", force: :cascade do |t|
    t.string "title"
    t.text "term"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "state"
    t.string "for"
    t.bigint "parent_id"
    t.index ["parent_id"], name: "index_terms_on_parent_id"
  end

  create_table "title_lists", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "priority"
  end

  create_table "translations", force: :cascade do |t|
    t.string "locale"
    t.string "key"
    t.text "value"
    t.text "interpolations"
    t.boolean "is_proc", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
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
    t.string "name"
    t.string "nickname"
    t.string "image"
    t.string "email"
    t.json "tokens"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "avatar"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

  add_foreign_key "candidate_current_companies", "candidates"
  add_foreign_key "candidate_educations", "candidates"
  add_foreign_key "company_abouts", "companies"
end
