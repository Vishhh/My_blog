json.array!(@questions) do |question|
  json.extract! question, :id, :que
  json.url question_url(question, format: :json)
end
