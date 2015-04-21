class LineItem < ActiveRecord::Base
  belongs_to :design
  belongs_to :cart
  validate :unique_per_cart

  def unique_per_cart
    if self.cart.line_items.any? {|line_item| line_item.design == self.design}
      errors.add(:base, "El diseño ya está en el carrito")
    end
  end
end
