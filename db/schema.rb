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

ActiveRecord::Schema.define(version: 2018_10_19_222126) do

  create_table "evaluations", force: :cascade do |t|
    t.decimal "total"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "project_id"
    t.integer "judge_id"
    t.index ["judge_id"], name: "index_evaluations_on_judge_id"
    t.index ["project_id"], name: "index_evaluations_on_project_id"
  end

  create_table "evaluations_questions", force: :cascade do |t|
    t.integer "evaluation_id"
    t.integer "questions_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "result", default: 0
    t.index ["evaluation_id"], name: "index_evaluations_questions_on_evaluation_id"
    t.index ["questions_id"], name: "index_evaluations_questions_on_questions_id"
  end

  create_table "expertise_areas", force: :cascade do |t|
    t.string "area"
  end

  create_table "expertise_areas_judges", force: :cascade do |t|
    t.integer "expertise_area_id"
    t.integer "judge_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["expertise_area_id"], name: "index_expertise_areas_judges_on_expertise_area_id"
    t.index ["judge_id"], name: "index_expertise_areas_judges_on_judge_id"
  end

  create_table "judges", force: :cascade do |t|
    t.boolean "has_tablet"
    t.integer "department"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_judges_on_user_id"
  end

  create_table "kinds", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "professors", force: :cascade do |t|
    t.string "enrollment"
    t.string "email"
    t.integer "department"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.integer "field"
    t.integer "client"
    t.string "abstract"
    t.string "video_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "status", default: 0
    t.integer "professor_id"
    t.integer "score", default: 0
<<<<<<< HEAD
    t.string "reason"
=======
    t.string "reason", default: "No reason"
    t.boolean "assistance", default: false
    t.boolean "active", default: false
>>>>>>> e7f07cdbd780e8346edf36056c7204982eb85056
    t.integer "kind_id"
    t.index ["kind_id"], name: "index_projects_on_kind_id"
    t.index ["professor_id"], name: "index_projects_on_professor_id"
    t.index ["user_id"], name: "index_projects_on_user_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "name"
    t.string "text"
    t.integer "scale"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "expertise_area_id"
    t.index ["expertise_area_id"], name: "index_questions_on_expertise_area_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "enrollment"
    t.string "major"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "project_id"
    t.index ["project_id"], name: "index_students_on_project_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "crypted_password"
    t.string "salt"
    t.string "role", null: false
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
