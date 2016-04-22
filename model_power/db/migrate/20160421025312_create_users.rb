class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :uid, :unique=>true
      t.boolean :sex
      t.integer :age
      t.string :name
      t.string :password_digest, null:false
      t.boolean :admin

      t.timestamps null: false
    end
  end
end
