require 'spec_helper'
describe Design do
  it { should validate_presence_of :title}
  it { should validate_presence_of :price}
end
