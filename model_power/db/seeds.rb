# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

for num in [*1..10] do
	if num >= 1 and num <= 3 then
		Question.create(a: "#{num}/1.jpg", b:"#{num}/2.jpg", c:"#{num}/3.jpg", d:"#{num}/4.jpg", y:"服に最も合う帽子を選ぼう！", z:"#{num}/a.jpg")
	elsif num >= 4 and num <= 9 then
		Question.create(a: "#{num}/1.jpg", b:"#{num}/2.jpg", c:"#{num}/3.jpg", d:"#{num}/4.jpg", y:"モデルの服装に最も似合うバッグを選ぼう！", z:"#{num}/a.jpg")
	else
		Question.create(a: "#{num}/1.jpg", b:"#{num}/2.jpg", c:"#{num}/3.jpg", d:"#{num}/4.jpg", y:"左のバッグに最も似ているバッグを選ぼう！", z:"#{num}/a.jpg")
	end
end