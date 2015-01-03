module CurrentCart
  extend ActiveSupport::Concern
  included do
    helper_method :current_cart
    helper_method :cart_amount
  end

  def cart_amount
    current_cart.line_items.count
  end

  private

  def set_cart
    @cart = Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    @cart = Cart.create
    session[:cart_id] = @cart.id
    @cart
  end

  def current_cart
    set_cart
  end
end