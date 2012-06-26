class Tag < ActiveRecord::Base
  has_and_belongs_to_many :articles
  attr_accessible :name
  validates_uniqueness_of :name

end
