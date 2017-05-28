class PurchasesController < InheritedResources::Base
  actions :new, :create

  def new
    redirect_to(root_path, notice: "Ups! Parece que no hay ningún diseño en el carrito, prueba a añadir alguno.") and return if current_cart.line_items.empty?
    @purchase = PurchaseInitializer.new(user: current_user).initialize_with_last_purchase_data
    new!
  end

  def create
    @purchase = Purchase.new(purchase_params)
    @purchase.user = current_user
    @purchase.cart = current_cart

    if @purchase.save
      token = params[:stripeToken]

      # Create the charge on Stripe's servers - this will charge the user's card
      begin
        payment = Stripe::Charge.create(
            amount: current_cart.total_price.fractional, # amount in cents, again
            currency: "eur",
            card: token,
            description: "Harigami - PurchaseID: #{ @purchase.id }",
            metadata: {
                "purchase_id"     => "#{ @purchase.id }",
                "user_id"     => "#{ current_user&.id }",
                "time"        => "#{ Time.now.to_i }",
            }
        )
      rescue Stripe::CardError => e
        flash[:alert] = "#{ e }"
        redirect_to current_cart_path
      end

      if payment.present? && payment.paid == true
        if @purchase.update_payment(payment) && PurchaseMailer.send_confirmation(@purchase.id).deliver_now
          flash.now[:notice] = t("purchase.success_payment")
          redirect_to static_url("thanks")
        else
          flash.now[:alert] = t("purchase.error_after_charging_payment")
          redirect_to root_url
        end
      else
        flash.now[:alert] = t("purchase.error_before_charging_payment")
        render :new
      end
    else
      flash.now[:alert] = t("purchase.error_before_charging_payment")
      render :new
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
