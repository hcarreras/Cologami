class LineItem < ActiveRecord::Base
  belongs_to :design
  belongs_to :cart
  validate :unique_per_cart

  def unique_per_cart
    if self.cart.line_items.any? {|line_item| line_item.design == self.design}
      errors.add(:base, "Design already in cart")
    end
  end
end
