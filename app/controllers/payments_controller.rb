class PaymentsController < ApplicationController

  def new
    @purchase = Purchase.find(params[:purchase])
  end

  def create
    if payment_params[:payment_status] == "Completed"
      @purchase = Purchase.find payment_params[:invoice]
      @purchase.update_attributes(status:"paid", paid_at: payment_params[:payment_date], transaction_id: payment_params[:txn_id])
    end
    render nothing: true
  end

  private

  def payment_params
    params.permit(:payment_status, :invoice, :txn_id, :payment_date)
  end
end
