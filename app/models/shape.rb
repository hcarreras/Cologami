class Shape < ActiveRecord::Base
  has_many :designs
  has_many :line_items
  validates_presence_of :title
  validates_uniqueness_of :title
end
