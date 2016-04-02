class AddShippingInfoToUser < ActiveRecord::Migration
  def change
    add_column :purchases, :customer_name, :string
    add_column :purchases, :customer_phone_number, :string
    add_column :purchases, :address_street, :string
    add_column :purchases, :address_additional_info, :string
    add_column :purchases, :address_zip, :string
    add_column :purchases, :address_city, :string
    add_column :purchases, :address_country, :string
  end
end
