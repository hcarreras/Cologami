class Purchase < ActiveRecord::Base
  belongs_to :cart
  belongs_to :user
  validates_presence_of :cart, :user
end
