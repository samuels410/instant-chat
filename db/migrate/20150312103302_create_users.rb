class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password_digest
      t.boolean :guest
      t.belongs_to :dialect
      t.timestamps
    end
  end
end
