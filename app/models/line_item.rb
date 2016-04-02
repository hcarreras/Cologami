class LineItem < ActiveRecord::Base
  belongs_to :shape
  belongs_to :cart
  validates :quantity, :shape_id, presence: true

  def price
    0
  end
end
