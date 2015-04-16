class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :purchases

  def has_design? design
    purchases.paid.any? do |purchase|
      purchase.cart.line_items.any? do |li|
        li.design == design
      end
    end
  end
end
