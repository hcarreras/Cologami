class PurchaseInitializer
  attr_accessor :user, :purchase

  def initialize(options = {})
    @user = options[:user]
    @purchase = Purchase.new
  end

  def initialize_with_last_purchase_data
    if last_purchase = user.purchases.last
      purchase.customer_name = last_purchase.customer_name
      purchase.customer_phone_number = last_purchase.customer_phone_number
      purchase.address_street = last_purchase.address_street
      purchase.address_additional_info = last_purchase.address_additional_info
      purchase.address_zip = last_purchase.address_zip
      purchase.address_city = last_purchase.address_city
      purchase.address_country = last_purchase.address_country
    end

    purchase
  end
end