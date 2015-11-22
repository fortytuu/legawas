# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Topic.all.destroy_all
Topic.create(title: 'Deutsch', description: 'Wähle ein Thema, das du üben möchtest.')
Topic.create(title: 'Mathe', description: 'Wähle einen Aufgabenbereich, den du üben möchtest.')

Category.all.destroy_all
topic_id = Topic.find_by_title('Deutsch').id
Category.create(topic_id: topic_id, short_title: 's/ss/ß', title: 'Die S-Laute (s, ss, ß)', response_options: ['s', 'ss', 'ß'])
Category.create(topic_id: topic_id, short_title: 'i/ie', title: 'Die langen und kurzen i-Laute', response_options: ['i', 'ie'])
Category.create(topic_id: topic_id, short_title: 'e/ä und eu/äu', title: 'Ableiten zur Unterscheidung zwischen e/ä und eu/äu', response_options: ['e', 'ä', 'eu', 'äu'])
Category.create(topic_id: topic_id, short_title: 'stummes H', title: 'Das stumme H', response_options: ['h', 'kein h'])