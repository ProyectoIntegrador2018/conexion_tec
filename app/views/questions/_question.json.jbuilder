json.extract! question, :id, :name, :text, :scale, :created_at, :updated_at
json.url question_url(question, format: :json)
