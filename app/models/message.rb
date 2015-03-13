class Message < ActiveRecord::Base
  include Api::Translation
  attr_accessible :content, :translated_message
  belongs_to :user

  validates_presence_of :user

  before_save :do_translation

  def do_translation
    translator = Api::Translation::MessageTranslator.new(self.user.dialect_id,content)
    self.translated_message = translator.translate_message
  end

end
