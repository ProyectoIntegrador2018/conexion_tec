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

ActiveRecord::Schema.define(version: 2019_10_17_235240) do

  create_table "administrators", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
  end

  create_table "assignments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "judge_id"
    t.integer "project_id"
  end

  create_table "categories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clients", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "client"
  end

  create_table "committees", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
  end

  create_table "departments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
  end

  create_table "editions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "number"
    t.date "registry_open"
    t.date "registry_limit"
    t.date "video_open"
    t.date "video_limit"
  end

  create_table "evaluation_questions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "evaluation_id", null: false
    t.bigint "question_id", null: false
    t.integer "result", default: 0
    t.index ["evaluation_id"], name: "index_evaluation_questions_on_evaluation_id"
    t.index ["question_id"], name: "index_evaluation_questions_on_question_id"
  end

  create_table "evaluations", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "result"
    t.integer "assignment_id"
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

  create_table "fields", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
  end

  create_table "judges", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.boolean "has_tablet"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "department_id"
    t.boolean "external", default: false
    t.string "ex_nombreEmpresaExterna"
    t.string "ex_contactName"
    t.string "ex_contactEmail"
    t.boolean "attended", default: false
  end

  create_table "majors", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
  end

  create_table "members", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email"
    t.string "name"
    t.integer "major_id"
    t.integer "project_id"
  end

  create_table "operatives", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
  end

  create_table "professors", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "department_id"
  end

  create_table "project_grades", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "total_grade"
    t.integer "abstract"
    t.integer "description"
    t.integer "abstract_impact"
    t.integer "abstract_problem"
    t.integer "abstract_results"
    t.integer "abstract_methodology"
    t.integer "abstract_feasibility"
    t.index ["project_id"], name: "index_project_grades_on_project_id"
  end

  create_table "projects", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "video_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "category_id"
    t.bigint "expertise_area_id"
    t.text "description"
    t.float "selection_score"
    t.float "evaluation_score"
    t.integer "professor_id"
    t.integer "student_id"
    t.integer "field_id"
    t.integer "client_id"
    t.integer "status_id"
    t.integer "edition_id"
    t.integer "attended", default: 0
    t.integer "stand_id"
    t.float "partial_score", default: 0.0
    t.boolean "semestrei"
    t.boolean "social_impact"
    t.text "abstract_impact"
    t.text "abstract_problem"
    t.text "abstract_results"
    t.text "abstract_methodology"
    t.text "abstract_feasibility"
    t.string "social_impact_empathy"
    t.string "social_impact_problem"
    t.string "social_impact_responsibility"
    t.index ["category_id"], name: "index_projects_on_category_id"
    t.index ["expertise_area_id"], name: "index_projects_on_expertise_area_id"
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

  create_table "stands", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "number"
  end

  create_table "statuses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "status"
  end

  create_table "students", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "major_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", null: false
    t.string "crypted_password"
    t.string "salt"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "userable_type"
    t.integer "userable_id"
    t.boolean "authorized", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "project_grades", "projects"
end
