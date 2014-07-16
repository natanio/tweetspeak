json.array!(@lessons) do |lesson|
  json.extract! lesson, :id, :title, :tags, :text, :audio
  json.url lesson_url(lesson, format: :json)
end
