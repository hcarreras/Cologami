class AddPaymentsStatusToPurchase < ActiveRecord::Migration
  def change
    add_column :purchases, :status, :string, default: "not paid"
    add_column :purchases, :transaction_id, :integer
    add_column :purchases, :paid_at, :datetime
  end
end
