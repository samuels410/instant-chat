class AddTranslationUrlToDialects < ActiveRecord::Migration
  def change
    add_column :dialects, :translation_url, :text
  end
end
