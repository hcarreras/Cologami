class PurchasesController < InheritedResources::Base
  actions :new, :create

  def new
    redirect_to(root_path, notice: "Ups! Parece que no hay ningún diseño en el carrito, prueba a añadir alguno.") and return if current_cart.line_items.empty?
    redirect_to new_user_session_path and return unless current_user
    @purchase = PurchaseInitializer.new(user: current_user).initialize_with_last_purchase_data
    new!
  end

  def create
    @purchase = Purchase.new(purchase_params)
    @purchase.user = current_user
    @purchase.cart = current_cart
    if @purchase.save
      session[:cart_id] = nil
      redirect_to @purchase.paypal_url(static_url("thanks"))
    else
      render new
    end
  end

  private
  def purchase_params
    params.require(:purchase).permit(
        :customer_name,
        :customer_phone_number,
        :address_street,
        :address_additional_info,
        :address_city,
        :address_zip,
        :address_country
    )
  end
end
