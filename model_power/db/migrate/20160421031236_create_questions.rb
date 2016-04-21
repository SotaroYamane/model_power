class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :qid
      t.string :1
      t.string :2
      t.string :3
      t.string :4
      t.string :a

      t.timestamps null: false
    end
  end
end
