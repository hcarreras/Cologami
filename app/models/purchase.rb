class Purchase < ActiveRecord::Base
  belongs_to :cart
  belongs_to :user
  validates :cart, :user, :customer_name, :address_street, :address_zip, :address_city, :address_country, presence: true

  scope :paid, -> { where(status:"paid") }

  def paypal_url(return_url)
    values = {
        business: 'seller@cologami.com',
        cmd: '_cart',
        upload: 1,
        return: return_url,
        invoice: id,
        currency_code: "EUR",
        notify_url: "#{Rails.application.secrets.app_host}/payments"
    }
    cart.line_items.each_with_index do |item, index|
      values.merge!({
                        "amount_#{index+1}" => item.price,
                        "item_name_#{index+1}" => item.shape.title,
                    })
    end
    "#{Rails.application.secrets.paypal_host}/cgi-bin/webscr?" + values.to_query
  end
end
