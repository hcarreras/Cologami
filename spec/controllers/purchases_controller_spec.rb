require 'spec_helper'
require 'contexts/purchases_controller'

RSpec.describe PurchasesController, type: :controller do
  include_context :purchases_controller

  describe "#NEW" do
    subject { get :new }
    context "empty cart" do
      before do
        set_current_cart Cart.new
      end
      it "redirects to root_url" do
        subject
        expect(response).to redirect_to(root_url)
      end
    end
    context "cart with items" do
      before do
        set_current_cart Cart.new
      end

      context "no current user" do
        before do
          set_current_cart create(:cart_with_design)
        end

        it "renders new" do
          subject
          expect(response).to render_template(:new)
        end
      end

      context "current_user" do
        let!(:current_user){create(:user)}
        context "items on cart" do
          before do
            set_current_cart create(:cart_with_design)
            sign_in current_user
          end

          it "returns 200" do
            subject
            expect(response.status).to eq(200)
          end

          it "renders new" do
            subject
            expect(response).to render_template(:new)
          end

          context "user has previous purchases" do
            let!(:purchase){
              create(
                  :purchase,
                  :paid,
                  user: current_user,
                  customer_name: "David Piano",
                  address_street: "Fake street 123",
                  address_zip: "04001",
                  address_city: "Almería",
                  address_country: "ESPAÑA"
              )
            }

            it "purchase initialise with former details" do
              subject
              expect(assigns[:purchase].customer_name).to eq("David Piano")
              expect(assigns[:purchase].address_street).to eq("Fake street 123")
              expect(assigns[:purchase].address_zip).to eq("04001")
              expect(assigns[:purchase].address_city).to eq("Almería")
              expect(assigns[:purchase].address_country).to eq("ESPAÑA")
            end
          end
        end
      end
    end
  end

  describe "#Create", focus: true do
    context "purchase is not saved" do
      let!(:user){ create(:user)}

      before do
        expect_any_instance_of(Purchase).to receive(:save).and_return(false)
      end

      subject { post :create, valid_create_params}

      it "renders new" do
        subject
        expect(response).to render_template(:new)
      end

      it "shows error message" do
        subject
        expect(flash[:alert]).to eq I18n.t("purchase.error_before_charging_payment")
      end
    end

    context "purchase is saved" do
      let!(:cart){ create(:cart_with_design)}
      let!(:current_user){create(:user)}
      subject { post :create, valid_create_params}

      before do
        Timecop.freeze
        set_current_cart cart
        sign_in current_user
      end

      context "payment goes alright" do
        before do
          expect_stripe_charge
        end

        it "redirects to thank you" do
          subject
          expect(response).to redirect_to static_url("thanks")
        end
      end

      context "payment fails" do
        before do
          expect_failed_stripe_charge
        end

        it "renders new" do
          subject
          expect(response).to render_template :new
          expect(flash[:alert]).to eq I18n.t("purchase.error_before_charging_payment")
        end
      end
    end
  end
end
