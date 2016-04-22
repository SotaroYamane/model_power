# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Result.create(qid: 1, uid: "sotaro", ans: "a")
Result.create(qid: 2, uid: "sotaro", ans: "b")
Result.create(qid: 2, uid: "Yamane", ans: "c")

Question.create(a: "path_to_A", b:"path_to_B", c:"path_to_C", d:"path_to_D", z:"path_to_Z")
Question.create(a: "path_to_A", b:"path_to_B", c:"path_to_C", d:"path_to_D", z:"path_to_Z_その2")
