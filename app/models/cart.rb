class Cart < ActiveRecord::Base
  has_many :line_items, :dependent => :destroy

  def total_price
    self.line_items.map{|li| li.price}.sum
  end
end
