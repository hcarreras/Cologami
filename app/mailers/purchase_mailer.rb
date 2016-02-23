class PurchaseMailer < ActionMailer::Base
  default from: FROM_EMAIL

  def send_confirmation(purchase)
    @purchase = purchase
    @customer = purchase.user

    mail(to: @customer.email, subject: I18n.t("mailer:purchase_mailer.send_confirmation.subject"))
  end
end
