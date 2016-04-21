class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :qid
      t.string :a
      t.string :b
      t.string :c
      t.string :d
      t.string :z

      t.timestamps null: false
    end
  end
end
