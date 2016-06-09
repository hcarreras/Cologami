class PurchaseMailer < ActionMailer::Base
  default from: FROM_EMAIL
  helper LineItemHelper

  def send_confirmation(purchase)
    @purchase = purchase
    @customer = purchase.user

    mail(to: @customer.email, subject: I18n.t("mailer.purchase_mailer.send_confirmation.subject"), bcc: ENV["PURCHASE_CONFIRMATION_EMAIL_BCC"])
  end
end
