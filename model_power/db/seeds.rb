# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

for num in [*1..10] do
	if num != 10 then
		Question.create(a: "#{num}/1.jpg", b:"#{num}/2.jpg", c:"#{num}/3.jpg", d:"#{num}/4.jpg", y:"左の画像に合うものを下の画像から選んで下さい", z:"#{num}/a.jpg")
	else
		Question.create(a: "#{num}/1.jpg", b:"#{num}/2.jpg", c:"#{num}/3.jpg", d:"#{num}/4.jpg", y:"左の画像に最も似ているものを下の画像から選んで下さい", z:"#{num}/a.jpg")
	end
end