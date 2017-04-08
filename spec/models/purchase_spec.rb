require 'spec_helper'
describe Purchase, type: :model do
  it { should validate_presence_of :cart}
  it { should validate_presence_of :customer_name}
  it { should validate_presence_of :address_street}
  it { should validate_presence_of :address_zip}
  it { should validate_presence_of :address_city}
  it { should validate_presence_of :address_country}
end
