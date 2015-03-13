class AddTranslatedMessageToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :translated_message, :text
  end
end
