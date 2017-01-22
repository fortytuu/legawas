errors = @topic.errors

if errors.present?
  json.errors errors
else
  json.id @topic.id
  json.title @topic.title
  json.description @topic.description
end
