class User < ActiveRecord::Base

  belongs_to :dialect
  has_many :messages

  attr_accessible :username, :email, :password, :password_confirmation, :guest, :dialect_id

  validates_presence_of :username, :email, :password_digest, unless: :guest?
  validates_confirmation_of :password

  require 'bcrypt'
  attr_reader :password
  include ActiveModel::SecurePassword::InstanceMethodsOnActivation
  
  def self.new_guest
    new { |u| u.guest = true }
  end

  
  def move_to(user)
    messages.update_all(user_id: user.id)
  end
end
