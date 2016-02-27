errors = @category.errors

if errors.present?
	json.errors errors
else
	json.id @category.id
	json.topic_id @category.topic_id
	json.short_title @category.short_title
	json.title @category.title
	json.description @category.description
	json.response_options @category.response_options
	json.url @category.url
end