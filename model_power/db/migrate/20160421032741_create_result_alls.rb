class CreateResultAlls < ActiveRecord::Migration
  def change
    create_table :result_alls do |t|
      t.integer :qid
      t.boolean :sex
      t.integer :a_1
      t.integer :a_2
      t.integer :a_3
      t.integer :a_4

      t.timestamps null: false
    end
  end
end
