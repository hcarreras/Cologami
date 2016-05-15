class AddPriceDetailsToPurchases < ActiveRecord::Migration
  def change
    add_column :purchases, :price, :integer
    add_column :purchases, :payment_data, :string
    add_column :purchases, :payment_id, :integer
    add_column :purchases, :expire_month, :string
    add_column :purchases, :expire_year, :string
    add_column :purchases, :last4, :string
  end
end
