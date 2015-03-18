class Design < ActiveRecord::Base
  has_many :images, :class_name => 'Design::Image'
  has_many :line_items
  belongs_to :shape
  accepts_nested_attributes_for :images
  accepts_nested_attributes_for :shape
  mount_uploader :sheet, SheetUploader


  validates_presence_of :title, :price
  validates :title, uniqueness: { scope: :shape}
  before_destroy :ensure_not_reference_by_any_line_item

  private

  def ensure_not_reference_by_any_line_item
    unless line_items.empty?
      errors.add(:base, "Line items present")
      return false
    end
    true
  end
end
