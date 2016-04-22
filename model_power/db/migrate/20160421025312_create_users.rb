class CreateUsers < ActiveRecord::Migration
  def change
    execute "CREATE TABLE users (uid STRING PRIMARY KEY NOT NULL, sex BOOLEAN, age INTEGER, name STRING, password_digest STRING NOT NULL, score INTEGER, admin BOOLEAN)"
  end
end
