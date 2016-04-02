require 'spec_helper'
describe LineItem, type: :model do
  it { should validate_presence_of :quantity}
  it { should validate_presence_of :shape_id}
  it { should belong_to :shape}
end
