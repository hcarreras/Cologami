class LineItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :cart
  validate :unique_per_cart

  def unique_per_cart
    if self.cart.line_items.any? {|line_item| line_item.id == self.id}
      errors.add(:base, "Design already in cart")
    end
  end
end
