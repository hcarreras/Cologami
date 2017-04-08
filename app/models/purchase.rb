class Purchase < ActiveRecord::Base
  belongs_to :cart
  belongs_to :user
  validates :cart, :customer_name, :address_street, :address_zip, :address_city, :address_country, presence: true
  has_many :line_items, through: :cart

  scope :paid, -> { where(status:"paid") }

  def update_payment(payment)
    self.price          = payment.amount
    self.payment_data   = payment.to_json
    self.payment_id     = payment.id
    self.expire_month   = payment.source[:exp_month]
    self.expire_year    = payment.source[:exp_year]
    self.last4          = payment.source[:last4]
    self.status         = "paid"
    self.paid_at        = Time.now
    self.save
  end
end
