json.extract! student, :id, :name, :email, :enrollment, :major, :created_at, :updated_at
json.url student_url(student, format: :json)
