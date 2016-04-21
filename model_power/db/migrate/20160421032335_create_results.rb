class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.int :rid
      t.int :qid
      t.string :uid
      t.int :ans

      t.timestamps null: false
    end
  end
end
