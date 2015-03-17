class Users::SessionsController < Devise::SessionsController
  after_action :remove_bought_designs_from_cart, only: :create

  private
  def remove_bought_designs_from_cart
    current_cart.line_items.each do |line_item|
      if current_user.has_design?(line_item.design)
        current_cart.line_items.delete(line_item)
      end
    end
  end
end