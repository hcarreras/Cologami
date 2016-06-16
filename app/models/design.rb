class Design < ActiveRecord::Base
  has_many :images, :class_name => 'Design::Image'
  belongs_to :shape
  accepts_nested_attributes_for :images
  accepts_nested_attributes_for :shape


  validates_presence_of :title
  validates :title, uniqueness: { scope: :shape_id}
end
