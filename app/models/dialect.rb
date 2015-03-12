class Dialect < ActiveRecord::Base
  has_many :users
  attr_accessible :dialect
  validates_presence_of :dialect
  validates_uniqueness_of :dialect
end
