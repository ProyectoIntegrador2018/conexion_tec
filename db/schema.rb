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

ActiveRecord::Schema.define(version: 2018_11_15_194623) do

  create_table "categories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "evaluation_questions", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "evaluation_id", null: false
    t.bigint "question_id", null: false
    t.integer "result", default: 0
    t.index ["evaluation_id"], name: "index_evaluation_questions_on_evaluation_id"
    t.index ["question_id"], name: "index_evaluation_questions_on_question_id"
  end

  create_table "evaluations", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.decimal "total", precision: 10, default: "0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "project_id"
    t.bigint "judge_id"
    t.index ["judge_id"], name: "index_evaluations_on_judge_id"
    t.index ["project_id"], name: "index_evaluations_on_project_id"
  end

  create_table "event_dates", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.date "event"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "expertise_areas", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "area"
  end

  create_table "expertise_areas_judges", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "expertise_area_id"
    t.bigint "judge_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["expertise_area_id"], name: "index_expertise_areas_judges_on_expertise_area_id"
    t.index ["judge_id"], name: "index_expertise_areas_judges_on_judge_id"
  end

  create_table "judges", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.boolean "has_tablet"
    t.integer "department"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_judges_on_user_id"
  end

  create_table "professors", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "enrollment"
    t.string "email"
    t.integer "department"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "course_code"
    t.bigint "project_id"
    t.index ["project_id"], name: "index_professors_on_project_id"
  end

  create_table "projects", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.integer "field"
    t.integer "client"
    t.string "abstract"
    t.string "video_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.integer "status", default: 0
    t.decimal "score", precision: 10, default: "0"
    t.boolean "assistance", default: false
    t.boolean "active", default: false
    t.string "reason"
    t.bigint "category_id"
    t.bigint "expertise_area_id"
    t.integer "num_evaluations", default: 0
    t.integer "num_assignments", default: 0
    t.string "description"
    t.bigint "event_date_id"
    t.string "stand"
    t.index ["category_id"], name: "index_projects_on_category_id"
    t.index ["event_date_id"], name: "index_projects_on_event_date_id"
    t.index ["expertise_area_id"], name: "index_projects_on_expertise_area_id"
    t.index ["user_id"], name: "index_projects_on_user_id"
  end

  create_table "questions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "category_id"
    t.string "title"
    t.index ["category_id"], name: "index_questions_on_category_id"
  end

  create_table "students", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "enrollment"
    t.string "major"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "project_id"
    t.index ["project_id"], name: "index_students_on_project_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
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
