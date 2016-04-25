class CreateQuestions < ActiveRecord::Migration
  def change
    execute "CREATE TABLE questions (qid INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, a STRING, b STRING, c STRING, d STRING, y STRING, z STRING )"
  end
end
