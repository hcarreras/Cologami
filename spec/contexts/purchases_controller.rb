# -*- encoding : utf-8 -*-

RSpec.configure do
  shared_context :purchases_controller do

    def valid_create_params
      {
          purchase:{
              customer_name: "Jon Snow",
              customer_phone_number: "1122334455",
              address_street: "The wall 123",
              address_additional_info: "Highest tower, left door",
              address_city: "The north",
              address_zip: "04001",
              address_country: "Seven Kingdoms"
          },
          stripeToken: "1234"
      }
    end

    def stripe_params
      {
          amount: 500, # amount in cents, again
          currency: "eur",
          card: "1234",
          description: "Harigami - PurchaseID: 1",
          metadata: {
              "purchase_id"     => "1",
              "user_id"     => "1",
              "time"        => "#{ Time.now.to_i }",
          }
      }
    end

    def expect_stripe_charge
      stripe_response = double("Stripe::Charge").as_null_object
      expect(Stripe::Charge).to receive(:create).with(stripe_params).and_return(stripe_response)
      expect(stripe_response).to receive(:paid).and_return(true)
      expect(stripe_response).to receive(:present?).and_return(true)
      expect(stripe_response).to receive(:to_json).and_return({"data"=> "some_data".to_json})
      expect(stripe_response).to receive(:amount).and_return(5)
      expect(stripe_response).to receive(:id).and_return(1)
      expect(stripe_response).to receive(:source).at_least(1).times.and_return({exp_month: "11", exp_year: "19", last4: "1234"})
    end

    def expect_failed_stripe_charge
      stripe_response = double("Stripe::Charge").as_null_object
      expect(Stripe::Charge).to receive(:create).with(stripe_params).and_return(stripe_response)
      expect(stripe_response).to receive(:present?).and_return(true)
      expect(stripe_response).to receive(:paid).and_return(false)
    end
  end
end
