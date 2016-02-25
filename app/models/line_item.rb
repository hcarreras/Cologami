class LineItem < ActiveRecord::Base
  belongs_to :design
  belongs_to :cart
  validates :quantity, :design_id, presence: true
  delegate :price, to: :design, prefix: true
end
