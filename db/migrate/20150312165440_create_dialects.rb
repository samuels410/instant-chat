class CreateDialects < ActiveRecord::Migration
  def change
    create_table :dialects do |t|
      t.string :dialect
      t.timestamps
    end
  end
end
