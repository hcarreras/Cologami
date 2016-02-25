require 'spec_helper'
describe LineItem, type: :model do
  it { should validate_presence_of :quantity}
  it { should validate_presence_of :design_id}
end
