class OrdersController < InheritedResources::Base
  actions :new

  def new
    redirect_to users_path and return unless current_user
    new!
  end
end
