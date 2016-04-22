class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.integer :qid
      t.string :uid
      t.string :ans

      t.timestamps null: false
    end
  end
end
