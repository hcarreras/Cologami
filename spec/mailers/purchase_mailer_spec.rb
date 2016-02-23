require 'spec_helper'

RSpec.describe PurchaseMailer, type: :mailer do
  describe 'send_confirmation' do
    let!(:purchase){create(:purchase)}
    subject { PurchaseMailer.send_confirmation(purchase) }

    it 'sends mail' do
      expect do
        subject.deliver
      end.to change(ActionMailer::Base.deliveries, :count).by(1)
    end
  end
end
