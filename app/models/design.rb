class Design < ActiveRecord::Base
  has_many :images, :class_name => 'Design::Image'
  accepts_nested_attributes_for :images

  validates_presence_of :title, :price
end
