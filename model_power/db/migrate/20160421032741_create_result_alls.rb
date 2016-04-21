class CreateResultAlls < ActiveRecord::Migration
  def change
    create_table :result_alls do |t|
      t.int :qid
      t.boolean :sex
      t.int :a_1
      t.int :a_2
      t.int :a_3
      t.int :a_4

      t.timestamps null: false
    end
  end
end
