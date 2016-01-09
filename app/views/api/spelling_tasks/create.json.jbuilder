errors = @spelling_task.errors

if errors.present?
	json.errors errors
else
	json.id @spelling_task.id
	json.solution_text @spelling_task.solution_text
	json.fill_in_text @spelling_task.fill_in_text
end