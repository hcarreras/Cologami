require 'spec_helper'
describe Shape, type: :model do
  it { should validate_presence_of :title}
  it { should validate_uniqueness_of :title}
  it { should have_many :line_items}
end
