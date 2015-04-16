class Purchase < ActiveRecord::Base
  belongs_to :cart
  belongs_to :user
  validates_presence_of :cart, :user

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
                        "amount_#{index+1}" => item.design.price,
                        "item_name_#{index+1}" => item.design.title,
                    })
    end
    "#{Rails.application.secrets.paypal_host}/cgi-bin/webscr?" + values.to_query
  end
end
