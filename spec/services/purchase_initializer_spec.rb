require 'spec_helper'
describe PurchaseInitializer, type: :service do
  let!(:user){create(:user)}

  describe "initialize_with_last_purchase_data" do
    subject{ PurchaseInitializer.new(user: user).initialize_with_last_purchase_data }

    context "user has purchases" do
      let!(:purchase) do
        create(:purchase,
          user: user,
          customer_name: "Bolis Crescendo",
          customer_phone_number: "666123456",
          address_street: "Fake Street 37",
          address_additional_info: "Ground Floor",
          address_zip: "3030",
          address_city: "Almeria",
          address_country: "España"
        )
      end

      it "returns purchase with same shipping data" do
        expect(subject.customer_name).to eq("Bolis Crescendo")
        expect(subject.customer_phone_number).to eq("666123456")
        expect(subject.address_street).to eq("Fake Street 37")
        expect(subject.address_additional_info).to eq("Ground Floor")
        expect(subject.address_zip).to eq("3030")
        expect(subject.address_city).to eq("Almeria")
        expect(subject.address_country).to eq("España")
      end
    end

    context "user does not have purchases" do
      it "returns an new purchase" do
        expect(subject.customer_name).to eq(nil)
        expect(subject.customer_phone_number).to eq(nil)
        expect(subject.address_street).to eq(nil)
        expect(subject.address_additional_info).to eq(nil)
        expect(subject.address_zip).to eq(nil)
        expect(subject.address_city).to eq(nil)
        expect(subject.address_country).to eq(nil)
      end
    end
  end
end
