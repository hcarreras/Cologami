require 'spec_helper'
describe Design do
  it { should validate_presence_of :title}
  it { should validate_presence_of :price}
  it { should validate_uniqueness_of(:title).scoped_to(:shape_id)}
end
