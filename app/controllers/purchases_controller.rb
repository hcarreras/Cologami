class PurchasesController < InheritedResources::Base
  actions :new, :create

  def new
    redirect_to(root_path, notice: "Ups! It looks like there are no designs in your cart. Why don't you add some?") and return if current_cart.line_items.empty?
    redirect_to new_user_session_path and return unless current_user
    new!
  end

  def create
    @purchase = Purchase.new(params[:purchase])
    @purchase.user = current_user
    @purchase.cart = current_cart
    if @purchase.save
      session[:cart_id] = nil
      flash[:success] = "Gracias por su compra, ya puede acceder al contenido que ha comprado"
      redirect_to root_path
    else
      render new
    end
  end
end
