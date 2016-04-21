class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.integer :rid
      t.integer :qid
      t.string :uid
      t.integer :ans

      t.timestamps null: false
    end
  end
end
