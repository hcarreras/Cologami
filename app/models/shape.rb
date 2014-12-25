class Shape < ActiveRecord::Base
  has_many :designs
  validates_presence_of :title
  validates_uniqueness_of :title
end
